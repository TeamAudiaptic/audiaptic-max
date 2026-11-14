/**
 * Clock synchronization against the DAVHI server.
 *
 * The algorithm is specified in the Time Synchronization spike:
 * https://teamaudiaptic.github.io/audiaptic-docs/docs/spikes/time-sync
 *
 * This module has no dependencies and takes its clocks, timers, and server
 * request as arguments, so the same logic can be ported to the mobile client
 * and checked against the shared vectors in timeSync.vectors.json.
 *
 * Offsets are measured against a monotonic clock, not the wall clock, so an
 * operating-system clock correction cannot move server time.
 */

const SAMPLES_PER_BURST = 6;
const MAX_CONSECUTIVE_FAILURES = 2;
const RESYNC_INTERVAL_MS = 60000;
const RETRY_INTERVAL_MS = 10000;
const MAX_OFFSET_AGE_MS = 5 * 60000;
const ACCEPT_ERROR_FACTOR = 2;
const CLOCK_CHECK_INTERVAL_MS = 5000;
const CLOCK_STEP_THRESHOLD_MS = 5;

/**
 * Cristian's algorithm for one request.
 *
 * @param {number} t1 Local clock just before the request was sent.
 * @param {number} serverTimestamp Server clock when it handled the request.
 * @param {number} t4 Local clock when the response arrived.
 * @returns {{ offset: number, delay: number, error: number }} offset is what
 *   to add to the local clock to get server time.
 */
function computeSample(t1, serverTimestamp, t4) {
	const delay = t4 - t1;
	return {
		offset: serverTimestamp - (t1 + t4) / 2,
		delay,
		error: delay / 2
	};
}

/**
 * Picks the sample to keep from one burst: the first request is discarded as
 * connection warm-up, failed requests (null) are discarded, and the remaining
 * sample with the lowest delay wins.
 *
 * @param {Array<object | null>} samples Samples in the order they were taken.
 * @returns {object | null} The best sample, or null if none are usable.
 */
function selectBestSample(samples) {
	let best = null;
	for (const sample of samples.slice(1)) {
		if (sample !== null && (best === null || sample.delay < best.delay)) {
			best = sample;
		}
	}
	return best;
}

/**
 * Decides whether a new burst result replaces the current offset, so a burst
 * made under poor network conditions does not replace a good offset.
 *
 * @param {{ error: number, syncedAt: number } | null} current
 * @param {{ error: number }} candidate
 * @param {number} now Local clock, on the same clock as current.syncedAt.
 * @returns {boolean}
 */
function shouldAccept(current, candidate, now) {
	if (current === null) {
		return true;
	}
	if (candidate.error <= current.error * ACCEPT_ERROR_FACTOR) {
		return true;
	}
	return now - current.syncedAt > MAX_OFFSET_AGE_MS;
}

/**
 * Creates the controller that keeps an offset fresh.
 *
 * @param {object} options
 * @param {() => Promise<number>} options.fetchServerTime Resolves with the
 *   server's epoch milliseconds; rejects on failure or timeout.
 * @param {() => number} options.monotonicNow Monotonic milliseconds.
 * @param {() => number} options.wallNow Wall-clock epoch milliseconds.
 * @param {(result: object) => void} [options.onResult] Called after every
 *   burst with { accepted, reason, status }.
 * @param {Function} [options.setTimeout]
 * @param {Function} [options.clearTimeout]
 */
function createTimeSync(options) {
	const { fetchServerTime, monotonicNow, wallNow } = options;
	const onResult = options.onResult || (() => {});
	const startTimer = options.setTimeout || setTimeout;
	const cancelTimer = options.clearTimeout || clearTimeout;

	let current = null;
	let forceNext = false;
	let running = false;
	let inFlight = null;
	let resyncTimer = null;
	let clockCheckTimer = null;
	let lastCheck = null;

	function isSynced() {
		return current !== null;
	}

	/**
	 * Current time on the server's clock (epoch ms).
	 * - Offset already applied.
	 * - Wall clock until the first sync.
	 */
	function serverNow() {
		return current === null ? wallNow() : monotonicNow() + current.offset;
	}

	/** What to add to a wall-clock epoch time to put it on the server clock. */
	function wallOffset() {
		return serverNow() - wallNow();
	}

	function status() {
		if (current === null) {
			return { synced: false, offset: 0, error: 0, age: 0 };
		}
		return {
			synced: true,
			offset: wallOffset(),
			error: current.error,
			age: monotonicNow() - current.syncedAt
		};
	}

	async function takeSample() {
		const t1 = monotonicNow();
		const serverTimestamp = await fetchServerTime();
		const t4 = monotonicNow();
		return computeSample(t1, serverTimestamp, t4);
	}

	async function burst() {
		const samples = [];
		let consecutiveFailures = 0;
		let lastFailure = "no usable samples";

		while (samples.length < SAMPLES_PER_BURST && consecutiveFailures < MAX_CONSECUTIVE_FAILURES) {
			try {
				samples.push(await takeSample());
				consecutiveFailures = 0;
			} catch (error) {
				samples.push(null);
				consecutiveFailures += 1;
				lastFailure = error.message;
			}
		}

		const best = selectBestSample(samples);
		if (best === null) {
			return { accepted: false, reason: `Clock sync failed: ${lastFailure}` };
		}

		const now = monotonicNow();
		if (!forceNext && !shouldAccept(current, best, now)) {
			return { accepted: false, reason: null };
		}

		current = { offset: best.offset, error: best.error, syncedAt: now };
		forceNext = false;
		return { accepted: true, reason: null };
	}

	function scheduleResync(delayMs) {
		cancelTimer(resyncTimer);
		resyncTimer = running ? startTimer(() => { syncNow(); }, delayMs) : null;
	}

	/**
	 * Runs one burst. Calls made while a burst is in flight share its result.
	 * Never rejects.
	 *
	 * @returns {Promise<{ accepted: boolean, reason: string | null, status: object }>}
	 */
	function syncNow() {
		if (inFlight !== null) {
			return inFlight;
		}

		cancelTimer(resyncTimer);
		resyncTimer = null;
		inFlight = burst()
			.catch(error => ({ accepted: false, reason: `Clock sync failed: ${error.message}` }))
			.then(outcome => {
				inFlight = null;
				scheduleResync(outcome.accepted ? RESYNC_INTERVAL_MS : RETRY_INTERVAL_MS);
				const result = { ...outcome, status: status() };
				onResult(result);
				return result;
			});
		return inFlight;
	}

	/**
	 * The wall clock and the monotonic clock should advance together. If they
	 * do not, either the OS changed the wall clock or the machine slept and
	 * the monotonic clock paused; the next burst is accepted unconditionally.
	 */
	function checkClocks() {
		const check = { wall: wallNow(), monotonic: monotonicNow() };
		const previous = lastCheck;
		lastCheck = check;
		if (previous === null) {
			return;
		}

		const divergence = (check.wall - previous.wall) - (check.monotonic - previous.monotonic);
		if (Math.abs(divergence) > CLOCK_STEP_THRESHOLD_MS) {
			forceNext = true;
			syncNow();
		}
	}

	function scheduleClockCheck() {
		clockCheckTimer = startTimer(() => {
			if (!running) {
				return;
			}
			checkClocks();
			scheduleClockCheck();
		}, CLOCK_CHECK_INTERVAL_MS);
	}

	/** Runs a burst now and keeps the offset fresh until stop() is called. */
	function start() {
		if (!running) {
			running = true;
			lastCheck = null;
			checkClocks();
			scheduleClockCheck();
		}
		return syncNow();
	}

	/** Stops the timers. The last offset is kept and still applied. */
	function stop() {
		running = false;
		cancelTimer(resyncTimer);
		cancelTimer(clockCheckTimer);
		resyncTimer = null;
		clockCheckTimer = null;
	}

	return { start, stop, syncNow, serverNow, wallOffset, isSynced, status };
}

module.exports = {
	SAMPLES_PER_BURST,
	RESYNC_INTERVAL_MS,
	RETRY_INTERVAL_MS,
	MAX_OFFSET_AGE_MS,
	CLOCK_CHECK_INTERVAL_MS,
	CLOCK_STEP_THRESHOLD_MS,
	computeSample,
	selectBestSample,
	shouldAccept,
	createTimeSync
};

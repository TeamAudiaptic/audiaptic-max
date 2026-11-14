// Run with `npm test` (Node's built-in test runner; no Max required).
const test = require("node:test");
const assert = require("node:assert/strict");
const vectors = require("./timeSync.vectors.json");
const {
	SAMPLES_PER_BURST,
	RESYNC_INTERVAL_MS,
	RETRY_INTERVAL_MS,
	CLOCK_CHECK_INTERVAL_MS,
	computeSample,
	selectBestSample,
	shouldAccept,
	createTimeSync
} = require("./timeSync");

for (const vector of vectors.computeSample) {
	test(`computeSample: ${vector.name}`, () => {
		assert.deepEqual(computeSample(vector.t1, vector.serverTimestamp, vector.t4), vector.expected);
	});
}

for (const vector of vectors.selectBestSample) {
	test(`selectBestSample: ${vector.name}`, () => {
		assert.deepEqual(selectBestSample(vector.samples), vector.expected);
	});
}

for (const vector of vectors.shouldAccept) {
	test(`shouldAccept: ${vector.name}`, () => {
		assert.equal(shouldAccept(vector.current, vector.candidate, vector.now), vector.expected);
	});
}

/** Lets an in-flight burst finish; the simulated requests need no real time. */
async function settle() {
	for (let i = 0; i < 100; i += 1) {
		await Promise.resolve();
	}
}

/**
 * A simulated laptop and server. The monotonic clock starts at 0; the wall
 * clock and server clock are the monotonic clock plus adjustable offsets.
 * Each request takes `delays[i]` ms, split evenly, or fails if it is null.
 */
function createWorld({ wallStart = 1000000, serverAhead = 250, delays = [] } = {}) {
	const world = {
		monotonic: 0,
		wallOffset: wallStart,
		serverOffset: wallStart + serverAhead,
		delays: [...delays],
		defaultDelay: 20,
		requests: 0,
		timers: [],
		results: []
	};

	world.sync = createTimeSync({
		monotonicNow: () => world.monotonic,
		wallNow: () => world.monotonic + world.wallOffset,
		fetchServerTime: async () => {
			world.requests += 1;
			const delay = world.delays.length > 0 ? world.delays.shift() : world.defaultDelay;
			if (delay === null) {
				throw new Error("request failed");
			}
			world.monotonic += delay / 2;
			const serverTimestamp = world.monotonic + world.serverOffset;
			world.monotonic += delay / 2;
			return serverTimestamp;
		},
		onResult: result => world.results.push(result),
		setTimeout: (callback, delayMs) => {
			const timer = { callback, at: world.monotonic + delayMs };
			world.timers.push(timer);
			return timer;
		},
		clearTimeout: timer => {
			world.timers = world.timers.filter(candidate => candidate !== timer);
		}
	});

	/** Advances the clocks, firing due timers and letting bursts finish. */
	world.advance = async ms => {
		const end = world.monotonic + ms;
		for (;;) {
			const due = world.timers.filter(timer => timer.at <= end).sort((a, b) => a.at - b.at)[0];
			if (due === undefined) {
				break;
			}
			world.timers = world.timers.filter(timer => timer !== due);
			world.monotonic = Math.max(world.monotonic, due.at);
			due.callback();
			await settle();
		}
		world.monotonic = Math.max(world.monotonic, end);
	};

	return world;
}

test("serverNow is the wall clock before the first sync", () => {
	const world = createWorld();
	assert.equal(world.sync.isSynced(), false);
	assert.equal(world.sync.serverNow(), world.monotonic + world.wallOffset);
	assert.equal(world.sync.wallOffset(), 0);
	assert.deepEqual(world.sync.status(), { synced: false, offset: 0, error: 0, age: 0 });
});

test("a burst sends six requests and keeps the lowest-delay sample", async () => {
	const world = createWorld({ delays: [4, 30, 12, 50, 18, 26] });
	const result = await world.sync.syncNow();

	assert.equal(world.requests, SAMPLES_PER_BURST);
	assert.equal(result.accepted, true);
	assert.equal(result.status.synced, true);
	assert.equal(result.status.error, 6);
	assert.equal(result.status.offset, 250);
	assert.equal(world.sync.serverNow(), world.monotonic + world.serverOffset);
});

test("a wall-clock step does not move serverNow", async () => {
	const world = createWorld();
	await world.sync.syncNow();
	const before = world.sync.serverNow();

	world.wallOffset += 7000;

	assert.equal(world.sync.serverNow(), before);
	assert.equal(world.sync.wallOffset(), 250 - 7000);
});

test("a burst with no usable sample reports a failure and keeps the offset", async () => {
	const world = createWorld();
	await world.sync.syncNow();
	const before = world.sync.status().error;

	world.delays = [null, null];
	const result = await world.sync.syncNow();

	assert.equal(result.accepted, false);
	assert.match(result.reason, /request failed/);
	assert.equal(world.requests, SAMPLES_PER_BURST + 2);
	assert.equal(world.sync.status().error, before);
});

test("a much worse burst is rejected without an error", async () => {
	const world = createWorld();
	await world.sync.syncNow();

	world.defaultDelay = 400;
	const result = await world.sync.syncNow();

	assert.equal(result.accepted, false);
	assert.equal(result.reason, null);
	assert.equal(result.status.error, 10);
});

test("concurrent syncNow calls share one burst", async () => {
	const world = createWorld();
	const [first, second] = await Promise.all([world.sync.syncNow(), world.sync.syncNow()]);

	assert.equal(first, second);
	assert.equal(world.requests, SAMPLES_PER_BURST);
});

test("syncNow does not schedule anything unless started", async () => {
	const world = createWorld();
	await world.sync.syncNow();
	assert.equal(world.timers.length, 0);
});

test("start re-syncs every 60 s and stop ends it", async () => {
	const world = createWorld();
	await world.sync.start();
	assert.equal(world.results.length, 1);

	await world.advance(RESYNC_INTERVAL_MS + 1000);
	assert.equal(world.results.length, 2);

	world.sync.stop();
	assert.equal(world.timers.length, 0);
	await world.advance(RESYNC_INTERVAL_MS * 3);
	assert.equal(world.results.length, 2);
	assert.equal(world.sync.isSynced(), true);
});

test("a failed burst retries after 10 s", async () => {
	const world = createWorld({ delays: [null, null] });
	await world.sync.start();
	assert.equal(world.results[0].accepted, false);

	await world.advance(RETRY_INTERVAL_MS + 100);
	assert.equal(world.results.length, 2);
	assert.equal(world.results[1].accepted, true);
	world.sync.stop();
});

test("a clock step forces a re-sync within one check interval", async () => {
	const world = createWorld();
	await world.sync.start();

	// The machine slept: the monotonic clock paused while the wall clock and
	// the server clock kept running, so the stored offset is now wrong.
	world.wallOffset += 30000;
	world.serverOffset += 30000;
	// Make the next burst much worse; it must still be accepted.
	world.defaultDelay = 400;

	await world.advance(CLOCK_CHECK_INTERVAL_MS + 100);

	assert.equal(world.results.length, 2);
	assert.equal(world.results[1].accepted, true);
	assert.equal(world.sync.serverNow(), world.monotonic + world.serverOffset);
	world.sync.stop();
});

{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 1,
            "revision": 5,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [ 435.0, 228.0, 980.0, 540.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "comment": "Include strobe: 0 = off, 1 = on",
                    "id": "strobe-enabled-inlet",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1320.0, 100.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "strobe-enabled-inlet-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1320.0, 65.0, 220.0, 20.0 ],
                    "text": "Inlet 6: strobe enabled (0/1)"
                }
            },
            {
                "box": {
                    "comment": "Strobe frequency in Hz (0-20)",
                    "id": "strobeHz-inlet",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1550.0, 100.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "strobeHz-inlet-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1550.0, 65.0, 230.0, 20.0 ],
                    "text": "Inlet 7: strobe frequency (Hz)"
                }
            },
            {
                "box": {
                    "comment": "Strobe duty cycle (0.05-0.95)",
                    "id": "dutyCycle-inlet",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1790.0, 100.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "dutyCycle-inlet-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1790.0, 65.0, 230.0, 20.0 ],
                    "text": "Inlet 8: strobe duty cycle"
                }
            },
            {
                "box": {
                    "id": "strobe-pack",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "dictionary" ],
                    "patching_rect": [ 1400.0, 680.0, 280.0, 22.0 ],
                    "text": "dict.pack strobeHz: dutyCycle: @triggers 1"
                }
            },
            {
                "box": {
                    "id": "strobe-payload-pack",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 1,
                    "outlettype": [ "dictionary" ],
                    "patching_rect": [ 1120.0, 800.0, 500.0, 22.0 ],
                    "text": "dict.pack durationMs: intensity: transitionMs: strobe: @triggers 2"
                }
            },
            {
                "box": {
                    "id": "strobe-branch-index",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 1200.0, 600.0, 40.0, 22.0 ],
                    "text": "+ 1"
                }
            },
            {
                "box": {
                    "id": "strobe-payload-gate",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1080.0, 680.0, 65.0, 22.0 ],
                    "text": "gate 2 1"
                }
            },
            {
                "box": {
                    "id": "ui-strobeHz-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1550.0, 150.0, 210.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 28.0, 355.0, 210.0, 20.0 ],
                    "text": "Strobe frequency (Hz)"
                }
            },
            {
                "box": {
                    "id": "ui-strobeHz",
                    "maxclass": "number",
                    "maximum": 20,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1550.0, 220.0, 115.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 28.0, 380.0, 115.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "ui-strobeHz-default",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1550.0, 175.0, 110.0, 22.0 ],
                    "text": "loadmess 0."
                }
            },
            {
                "box": {
                    "id": "strobeHz-message",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1550.0, 330.0, 150.0, 22.0 ],
                    "text": "prepend strobeHz"
                }
            },
            {
                "box": {
                    "id": "ui-dutyCycle-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1790.0, 150.0, 210.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 250.0, 355.0, 210.0, 20.0 ],
                    "text": "Duty cycle"
                }
            },
            {
                "box": {
                    "format": 6,
                    "hint": "Drag to the right of the decimal point for 0.01 increments.",
                    "id": "ui-dutyCycle",
                    "maxclass": "flonum",
                    "maximum": 0.95,
                    "minimum": 0.05,
                    "numdecimalplaces": 2,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1790.0, 220.0, 115.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 250.0, 380.0, 115.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "ui-dutyCycle-default",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1790.0, 175.0, 110.0, 22.0 ],
                    "text": "loadmess 0.5"
                }
            },
            {
                "box": {
                    "id": "dutyCycle-message",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1790.0, 330.0, 150.0, 22.0 ],
                    "text": "prepend dutyCycle"
                }
            },
            {
                "box": {
                    "id": "ui-strobe-enabled",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1320.0, 220.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 28.0, 320.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "ui-strobe-enabled-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1320.0, 150.0, 200.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 62.0, 322.0, 200.0, 20.0 ],
                    "text": "Include strobe"
                }
            },
            {
                "box": {
                    "id": "strobe-enabled-message",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1320.0, 330.0, 155.0, 22.0 ],
                    "text": "prepend strobeEnabled"
                }
            },
            {
                "box": {
                    "fontsize": 18.0,
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 40.0, 15.0, 260.0, 27.0 ],
                    "text": "Torch event dictionary"
                }
            },
            {
                "box": {
                    "comment": "Duration in milliseconds",
                    "id": "duration-inlet",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 40.0, 100.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "duration-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 40.0, 65.0, 250.0, 20.0 ],
                    "text": "Inlet 1: duration (ms)"
                }
            },
            {
                "box": {
                    "id": "duration-message",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 40.0, 330.0, 115.0, 22.0 ],
                    "text": "prepend duration"
                }
            },
            {
                "box": {
                    "comment": "Execution timestamp in milliseconds; 0 uses the connection delay",
                    "id": "timestamp-inlet",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 100.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "timestamp-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 300.0, 65.0, 250.0, 20.0 ],
                    "text": "Inlet 2: timestamp (ms)"
                }
            },
            {
                "box": {
                    "id": "timestamp-message",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 330.0, 125.0, 22.0 ],
                    "text": "prepend timestamp"
                }
            },
            {
                "box": {
                    "comment": "Transition duration in milliseconds",
                    "id": "transition-inlet",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 820.0, 100.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "transition-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 820.0, 65.0, 250.0, 20.0 ],
                    "text": "Inlet 4: transition (ms)"
                }
            },
            {
                "box": {
                    "id": "transition-message",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 820.0, 330.0, 125.0, 22.0 ],
                    "text": "prepend transition"
                }
            },
            {
                "box": {
                    "comment": "Send the event by sending a bang",
                    "id": "send-inlet",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1080.0, 100.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "send-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1080.0, 65.0, 180.0, 20.0 ],
                    "text": "Inlet 5: bang to send"
                }
            },
            {
                "box": {
                    "id": "torch-js",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 40.0, 460.0, 90.0, 22.0 ],
                    "saved_object_attributes": {
                        "filename": "torch.js",
                        "parameter_enable": 0
                    },
                    "text": "js torch.js"
                }
            },
            {
                "box": {
                    "id": "route-fields",
                    "maxclass": "newobj",
                    "numinlets": 10,
                    "numoutlets": 10,
                    "outlettype": [ "", "", "", "", "", "", "", "", "", "" ],
                    "patching_rect": [ 40.0, 530.0, 1760.0, 22.0 ],
                    "text": "route schemaVersion type execTimestamp durationMs intensity transitionMs strobeEnabled strobeHz dutyCycle"
                }
            },
            {
                "box": {
                    "id": "payload-dict-pack",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 1,
                    "outlettype": [ "dictionary" ],
                    "patching_rect": [ 540.0, 800.0, 430.0, 22.0 ],
                    "text": "dict.pack durationMs: intensity: transitionMs: @triggers 2"
                }
            },
            {
                "box": {
                    "id": "payload-dict-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 540.0, 850.0, 200.0, 20.0 ],
                    "text": "Nested payload dictionary"
                }
            },
            {
                "box": {
                    "id": "event-dict-pack",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 1,
                    "outlettype": [ "dictionary" ],
                    "patching_rect": [ 40.0, 930.0, 392.0, 22.0 ],
                    "text": "dict.pack schemaVersion: type: relativeTimestamp: payload: @triggers 3"
                }
            },
            {
                "box": {
                    "id": "event-dict-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 680.0, 930.0, 600.0, 20.0 ],
                    "text": "Outer event dictionary: schemaVersion, type, execTimestamp, payload"
                }
            },
            {
                "box": {
                    "id": "json-view",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 40.0, 1000.0, 180.0, 22.0 ],
                    "text": "dict.serialize @mode json"
                }
            },
            {
                "box": {
                    "id": "print-output",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 140.0, 1060.0, 125.0, 22.0 ],
                    "text": "print torch-json"
                }
            },
            {
                "box": {
                    "comment": "Torch event dictionary: schemaVersion, type, execTimestamp, payload",
                    "id": "output",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 40.0, 1060.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "Torch intensity (integer)",
                    "id": "intensity-inlet",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 560.0, 100.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "intensity-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 560.0, 65.0, 250.0, 20.0 ],
                    "text": "Inlet 3: intensity (integer)"
                }
            },
            {
                "box": {
                    "id": "intensity-message",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 560.0, 330.0, 115.0, 22.0 ],
                    "text": "prepend intensity"
                }
            },
            {
                "box": {
                    "fontsize": 22.0,
                    "id": "ui-title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 2100.0, 65.0, 300.0, 32.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 24.0, 18.0, 360.0, 32.0 ],
                    "text": "DAVHI Torch"
                }
            },
            {
                "box": {
                    "id": "ui-subtitle",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 2100.0, 105.0, 450.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 26.0, 52.0, 420.0, 20.0 ],
                    "text": "Set the event values, then send a torch event."
                }
            },
            {
                "box": {
                    "id": "ui-duration-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 95.0, 150.0, 200.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 28.0, 92.0, 180.0, 20.0 ],
                    "text": "Duration (ms)"
                }
            },
            {
                "box": {
                    "id": "ui-duration-value",
                    "maxclass": "number",
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 95.0, 220.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 28.0, 116.0, 115.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "ui-timestamp-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 355.0, 150.0, 250.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 28.0, 163.0, 320.0, 20.0 ],
                    "text": "Execution timestamp (ms)"
                }
            },
            {
                "box": {
                    "id": "ui-timestamp-value",
                    "maxclass": "number",
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 355.0, 220.0, 150.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 28.0, 188.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "ui-use-delay-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 2100.0, 665.0, 420.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 28.0, 222.0, 420.0, 20.0 ],
                    "text": "Use 0 to apply the connection’s universal delay."
                }
            },
            {
                "box": {
                    "id": "ui-transition-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 875.0, 150.0, 200.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 28.0, 252.0, 180.0, 20.0 ],
                    "text": "Transition (ms)"
                }
            },
            {
                "box": {
                    "id": "ui-transition-value",
                    "maxclass": "number",
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 875.0, 220.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 28.0, 276.0, 115.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "ui-send-button",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1135.0, 220.0, 100.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 330.0, 276.0, 110.0, 24.0 ],
                    "text": "Send",
                    "texton": "Send"
                }
            },
            {
                "box": {
                    "id": "ui-intensity-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 615.0, 150.0, 200.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 175.0, 252.0, 140.0, 20.0 ],
                    "text": "Intensity (integer)"
                }
            },
            {
                "box": {
                    "id": "ui-intensity-value",
                    "maxclass": "number",
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 615.0, 220.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 175.0, 276.0, 115.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "ui-intensity-default",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 615.0, 185.0, 85.0, 22.0 ],
                    "text": "loadmess 0"
                }
            },
            {
                "box": {
                    "id": "ui-duration-default",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 95.0, 185.0, 110.0, 22.0 ],
                    "text": "loadmess set 250"
                }
            },
            {
                "box": {
                    "background": 1,
                    "bgcolor": [ 0.12, 0.14, 0.17, 1 ],
                    "id": "ui-background",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 2100.0, 145.0, 480.0, 500.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.0, 0.0, 480.0, 425.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "duration-message", 0 ],
                    "midpoints": [ 49.5, 315.0, 49.5, 315.0 ],
                    "source": [ "duration-inlet", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "torch-js", 0 ],
                    "midpoints": [ 49.5, 430.0, 49.5, 430.0 ],
                    "source": [ "duration-message", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "dutyCycle-message", 0 ],
                    "source": [ "dutyCycle-inlet", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "torch-js", 0 ],
                    "midpoints": [ 1799.5, 360.0, 1800.0, 360.0, 1800.0, 455.0, 49.5, 455.0 ],
                    "source": [ "dutyCycle-message", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "json-view", 0 ],
                    "midpoints": [ 49.5, 960.0, 50.0, 960.0, 50.0, 995.0, 49.5, 995.0 ],
                    "source": [ "event-dict-pack", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "intensity-message", 0 ],
                    "midpoints": [ 569.5, 315.0, 569.5, 315.0 ],
                    "source": [ "intensity-inlet", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "torch-js", 0 ],
                    "midpoints": [ 569.5, 400.0, 49.5, 400.0 ],
                    "source": [ "intensity-message", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "output", 0 ],
                    "midpoints": [ 49.5, 1030.0, 50.0, 1030.0, 50.0, 1055.0, 49.5, 1055.0 ],
                    "order": 1,
                    "source": [ "json-view", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "print-output", 0 ],
                    "midpoints": [ 49.5, 1030.0, 50.0, 1030.0, 50.0, 1055.0, 149.5, 1055.0 ],
                    "order": 0,
                    "source": [ "json-view", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "event-dict-pack", 3 ],
                    "midpoints": [ 549.5, 830.0, 485.0, 830.0, 485.0, 925.0, 329.25, 925.0 ],
                    "source": [ "payload-dict-pack", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "event-dict-pack", 2 ],
                    "midpoints": [ 436.3888888888889, 560.0, 435.0, 560.0, 435.0, 925.0, 236.0, 925.0 ],
                    "source": [ "route-fields", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "event-dict-pack", 1 ],
                    "midpoints": [ 242.94444444444446, 560.0, 245.0, 560.0, 245.0, 925.0, 142.75, 925.0 ],
                    "source": [ "route-fields", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "event-dict-pack", 0 ],
                    "midpoints": [ 49.5, 560.0, 50.0, 560.0, 50.0, 925.0, 49.5, 925.0 ],
                    "source": [ "route-fields", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "payload-dict-pack", 1 ],
                    "midpoints": [ 823.2777777777778, 560.0, 825.0, 560.0, 825.0, 795.0, 686.5, 795.0 ],
                    "order": 1,
                    "source": [ "route-fields", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "payload-dict-pack", 0 ],
                    "midpoints": [ 629.8333333333334, 560.0, 630.0, 560.0, 630.0, 795.0, 549.5, 795.0 ],
                    "order": 1,
                    "source": [ "route-fields", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "strobe-branch-index", 0 ],
                    "midpoints": [ 1210.1666666666667, 560.0, 1210.0, 560.0, 1210.0, 595.0, 1209.5, 595.0 ],
                    "source": [ "route-fields", 6 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "strobe-pack", 1 ],
                    "midpoints": [ 1597.0555555555557, 560.0, 1595.0, 560.0, 1595.0, 675.0, 1540.0, 675.0 ],
                    "source": [ "route-fields", 8 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "strobe-pack", 0 ],
                    "midpoints": [ 1403.611111111111, 560.0, 1405.0, 560.0, 1405.0, 675.0, 1409.5, 675.0 ],
                    "source": [ "route-fields", 7 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "strobe-payload-gate", 1 ],
                    "midpoints": [ 1016.7222222222222, 560.0, 1015.0, 560.0, 1015.0, 675.0, 1135.5, 675.0 ],
                    "source": [ "route-fields", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "strobe-payload-pack", 1 ],
                    "midpoints": [ 823.2777777777778, 560.0, 825.0, 560.0, 825.0, 795.0, 1249.75, 795.0 ],
                    "order": 0,
                    "source": [ "route-fields", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "strobe-payload-pack", 0 ],
                    "midpoints": [ 629.8333333333334, 560.0, 630.0, 560.0, 630.0, 795.0, 1129.5, 795.0 ],
                    "order": 0,
                    "source": [ "route-fields", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "torch-js", 0 ],
                    "midpoints": [ 1089.5, 370.0, 49.5, 370.0 ],
                    "source": [ "send-inlet", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "strobe-payload-gate", 0 ],
                    "midpoints": [ 1209.5, 630.0, 1210.0, 630.0, 1210.0, 675.0, 1089.5, 675.0 ],
                    "source": [ "strobe-branch-index", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "strobe-enabled-message", 0 ],
                    "source": [ "strobe-enabled-inlet", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "torch-js", 0 ],
                    "midpoints": [ 1329.5, 360.0, 1330.0, 360.0, 1330.0, 455.0, 49.5, 455.0 ],
                    "source": [ "strobe-enabled-message", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "strobe-payload-pack", 3 ],
                    "midpoints": [ 1409.5, 710.0, 1410.0, 710.0, 1410.0, 795.0, 1490.25, 795.0 ],
                    "source": [ "strobe-pack", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "payload-dict-pack", 2 ],
                    "midpoints": [ 1089.5, 710.0, 1090.0, 710.0, 1090.0, 795.0, 823.5, 795.0 ],
                    "source": [ "strobe-payload-gate", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "strobe-payload-pack", 2 ],
                    "midpoints": [ 1135.5, 710.0, 1135.0, 710.0, 1135.0, 795.0, 1370.0, 795.0 ],
                    "source": [ "strobe-payload-gate", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "event-dict-pack", 3 ],
                    "midpoints": [ 1129.5, 830.0, 1130.0, 830.0, 1130.0, 925.0, 329.25, 925.0 ],
                    "source": [ "strobe-payload-pack", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "strobeHz-message", 0 ],
                    "source": [ "strobeHz-inlet", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "torch-js", 0 ],
                    "midpoints": [ 1559.5, 360.0, 1560.0, 360.0, 1560.0, 455.0, 49.5, 455.0 ],
                    "source": [ "strobeHz-message", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "timestamp-message", 0 ],
                    "midpoints": [ 309.5, 315.0, 309.5, 315.0 ],
                    "source": [ "timestamp-inlet", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "torch-js", 0 ],
                    "midpoints": [ 309.5, 415.0, 49.5, 415.0 ],
                    "source": [ "timestamp-message", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "route-fields", 0 ],
                    "midpoints": [ 49.5, 490.0, 50.0, 490.0, 50.0, 525.0, 49.5, 525.0 ],
                    "source": [ "torch-js", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "transition-message", 0 ],
                    "midpoints": [ 829.5, 315.0, 829.5, 315.0 ],
                    "source": [ "transition-inlet", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "torch-js", 0 ],
                    "midpoints": [ 829.5, 385.0, 49.5, 385.0 ],
                    "source": [ "transition-message", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-duration-value", 0 ],
                    "source": [ "ui-duration-default", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "duration-message", 0 ],
                    "midpoints": [ 104.5, 290.0, 49.5, 290.0 ],
                    "source": [ "ui-duration-value", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "dutyCycle-message", 0 ],
                    "midpoints": [ 1799.5, 250.0, 1800.0, 250.0, 1800.0, 325.0, 1799.5, 325.0 ],
                    "source": [ "ui-dutyCycle", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-dutyCycle", 0 ],
                    "midpoints": [ 1799.5, 205.0, 1800.0, 205.0, 1800.0, 215.0, 1799.5, 215.0 ],
                    "source": [ "ui-dutyCycle-default", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-intensity-value", 0 ],
                    "source": [ "ui-intensity-default", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "intensity-message", 0 ],
                    "midpoints": [ 624.5, 290.0, 569.5, 290.0 ],
                    "source": [ "ui-intensity-value", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "torch-js", 0 ],
                    "midpoints": [ 1144.5, 355.0, 49.5, 355.0 ],
                    "source": [ "ui-send-button", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "strobe-enabled-message", 0 ],
                    "midpoints": [ 1329.5, 250.0, 1330.0, 250.0, 1330.0, 325.0, 1329.5, 325.0 ],
                    "source": [ "ui-strobe-enabled", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "strobeHz-message", 0 ],
                    "midpoints": [ 1559.5, 250.0, 1560.0, 250.0, 1560.0, 325.0, 1559.5, 325.0 ],
                    "source": [ "ui-strobeHz", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-strobeHz", 0 ],
                    "midpoints": [ 1559.5, 205.0, 1560.0, 205.0, 1560.0, 215.0, 1559.5, 215.0 ],
                    "source": [ "ui-strobeHz-default", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "timestamp-message", 0 ],
                    "midpoints": [ 364.5, 290.0, 309.5, 290.0 ],
                    "source": [ "ui-timestamp-value", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "transition-message", 0 ],
                    "midpoints": [ 884.5, 290.0, 829.5, 290.0 ],
                    "source": [ "ui-transition-value", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}
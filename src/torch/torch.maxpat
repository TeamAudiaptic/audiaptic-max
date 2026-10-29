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
        "rect": [ 436.0, 228.0, 980.0, 540.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "id": "strobe-pack",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "patching_rect": [ 1400, 680, 280, 22 ],
                    "text": "dict.pack strobeHz: dutyCycle: @triggers 1",
                    "outlettype": [
                        "dictionary"
                    ]
                }
            },
            {
                "box": {
                    "id": "strobe-payload-pack",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 1,
                    "patching_rect": [ 1120, 800, 500, 22 ],
                    "text": "dict.pack durationMs: intensity: transitionMs: strobe: @triggers 2",
                    "outlettype": [
                        "dictionary"
                    ]
                }
            },
            {
                "box": {
                    "id": "strobe-branch-index",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "patching_rect": [ 1200, 600, 40, 22 ],
                    "text": "+ 1",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "strobe-payload-gate",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "patching_rect": [ 1080, 680, 65, 22 ],
                    "text": "gate 2 1",
                    "outlettype": [
                        "",
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "ui-strobeHz-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1550, 150, 210, 20 ],
                    "text": "Strobe frequency (Hz)",
                    "presentation": 1,
                    "presentation_rect": [
                        28,
                        355,
                        210,
                        20
                    ]
                }
            },
            {
                "box": {
                    "id": "ui-strobeHz",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 1550, 220, 115, 22 ],
                    "minimum": 0.0,
                    "maximum": 20.0,
                    "parameter_enable": 0,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        28,
                        380,
                        115,
                        22
                    ]
                }
            },
            {
                "box": {
                    "id": "ui-strobeHz-default",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 1550, 175, 110, 22 ],
                    "text": "loadmess 0.0",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "strobeHz-message",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 1550, 330, 150, 22 ],
                    "text": "prepend strobeHz",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "ui-dutyCycle-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1790, 150, 210, 20 ],
                    "text": "Duty cycle",
                    "presentation": 1,
                    "presentation_rect": [
                        250,
                        355,
                        210,
                        20
                    ]
                }
            },
            {
                "box": {
                    "id": "ui-dutyCycle",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "patching_rect": [ 1790, 220, 115, 22 ],
                    "minimum": 0.05,
                    "maximum": 0.95,
                    "parameter_enable": 0,
                    "outlettype": [
                        "",
                        "bang"
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        250,
                        380,
                        115,
                        22
                    ]
                }
            },
            {
                "box": {
                    "id": "ui-dutyCycle-default",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 1790, 175, 110, 22 ],
                    "text": "loadmess 0.5",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "dutyCycle-message",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 1790, 330, 150, 22 ],
                    "text": "prepend dutyCycle",
                    "outlettype": [
                        ""
                    ]
                }
            },
            {
                "box": {
                    "id": "ui-strobe-enabled",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 1320, 220, 24, 24 ],
                    "parameter_enable": 0,
                    "outlettype": [
                        "int"
                    ],
                    "presentation": 1,
                    "presentation_rect": [
                        28,
                        320,
                        24,
                        24
                    ]
                }
            },
            {
                "box": {
                    "id": "ui-strobe-enabled-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1320, 150, 200, 20 ],
                    "text": "Include strobe",
                    "presentation": 1,
                    "presentation_rect": [
                        62,
                        322,
                        200,
                        20
                    ]
                }
            },
            {
                "box": {
                    "id": "strobe-enabled-message",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "patching_rect": [ 1320, 330, 155, 22 ],
                    "text": "prepend strobeEnabled",
                    "outlettype": [
                        ""
                    ]
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
                    "text": "Inlet 2: exec timestamp (ms)"
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
                    "outlettype": [
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        ""
                    ],
                    "patching_rect": [ 40, 530, 1760, 22.0 ],
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
                    "patching_rect": [ 540, 800, 430.0, 22.0 ],
                    "text": "dict.pack durationMs: intensity: transitionMs: @triggers 2"
                }
            },
            {
                "box": {
                    "id": "payload-dict-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 540, 850, 200.0, 20.0 ],
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
                    "patching_rect": [ 40, 930, 600.0, 22.0 ],
                    "text": "dict.pack schemaVersion: type: execTimestamp: payload: @triggers 3"
                }
            },
            {
                "box": {
                    "id": "event-dict-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 680, 930, 600.0, 20.0 ],
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
                    "patching_rect": [ 40, 1000, 180.0, 22.0 ],
                    "text": "dict.serialize @mode json"
                }
            },
            {
                "box": {
                    "id": "print-output",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 140, 1060, 125.0, 22.0 ],
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
                    "patching_rect": [ 40, 1060, 30.0, 30.0 ]
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
                    "patching_rect": [ 2100, 65, 300.0, 32.0 ],
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
                    "patching_rect": [ 2100, 105, 450.0, 20.0 ],
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
                    "text": "Execution timestamp (Unix ms)"
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
                    "patching_rect": [ 2100, 665, 420.0, 20.0 ],
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
                    "bgcolor": [
                        0.12,
                        0.14,
                        0.17,
                        1
                    ],
                    "id": "ui-background",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 2100, 145, 480.0, 500.0 ],
                    "presentation": 1,
                    "presentation_rect": [
                        0.0,
                        0.0,
                        480.0,
                        425.0
                    ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "source": [
                        "ui-strobeHz-default",
                        0
                    ],
                    "destination": [
                        "ui-strobeHz",
                        0
                    ],
                    "midpoints": [ 1559.5, 205, 1560, 205, 1560, 215, 1559.5, 215 ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "ui-strobeHz",
                        0
                    ],
                    "destination": [
                        "strobeHz-message",
                        0
                    ],
                    "midpoints": [ 1559.5, 250, 1560, 250, 1560, 325, 1559.5, 325 ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "strobeHz-message",
                        0
                    ],
                    "destination": [
                        "torch-js",
                        0
                    ],
                    "midpoints": [ 1559.5, 360, 1560, 360, 1560, 455, 49.5, 455 ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "ui-dutyCycle-default",
                        0
                    ],
                    "destination": [
                        "ui-dutyCycle",
                        0
                    ],
                    "midpoints": [ 1799.5, 205, 1800, 205, 1800, 215, 1799.5, 215 ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "ui-dutyCycle",
                        0
                    ],
                    "destination": [
                        "dutyCycle-message",
                        0
                    ],
                    "midpoints": [ 1799.5, 250, 1800, 250, 1800, 325, 1799.5, 325 ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "dutyCycle-message",
                        0
                    ],
                    "destination": [
                        "torch-js",
                        0
                    ],
                    "midpoints": [ 1799.5, 360, 1800, 360, 1800, 455, 49.5, 455 ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "ui-strobe-enabled",
                        0
                    ],
                    "destination": [
                        "strobe-enabled-message",
                        0
                    ],
                    "midpoints": [ 1329.5, 250, 1330, 250, 1330, 325, 1329.5, 325 ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "strobe-enabled-message",
                        0
                    ],
                    "destination": [
                        "torch-js",
                        0
                    ],
                    "midpoints": [ 1329.5, 360, 1330, 360, 1330, 455, 49.5, 455 ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "route-fields",
                        6
                    ],
                    "destination": [
                        "strobe-branch-index",
                        0
                    ],
                    "midpoints": [ 1210.1666666666667, 560, 1210, 560, 1210, 595, 1209.5, 595 ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "strobe-branch-index",
                        0
                    ],
                    "destination": [
                        "strobe-payload-gate",
                        0
                    ],
                    "midpoints": [ 1209.5, 630, 1210, 630, 1210, 675, 1089.5, 675 ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "route-fields",
                        7
                    ],
                    "destination": [
                        "strobe-pack",
                        0
                    ],
                    "midpoints": [ 1403.611111111111, 560, 1405, 560, 1405, 675, 1409.5, 675 ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "route-fields",
                        8
                    ],
                    "destination": [
                        "strobe-pack",
                        1
                    ],
                    "midpoints": [ 1597.0555555555557, 560, 1595, 560, 1595, 675, 1540, 675 ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "strobe-pack",
                        0
                    ],
                    "destination": [
                        "strobe-payload-pack",
                        3
                    ],
                    "midpoints": [ 1409.5, 710, 1410, 710, 1410, 795, 1490.25, 795 ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "route-fields",
                        3
                    ],
                    "destination": [
                        "strobe-payload-pack",
                        0
                    ],
                    "order": 1,
                    "midpoints": [ 629.8333333333334, 560, 630, 560, 630, 795, 1129.5, 795 ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "route-fields",
                        4
                    ],
                    "destination": [
                        "strobe-payload-pack",
                        1
                    ],
                    "order": 1,
                    "midpoints": [ 823.2777777777778, 560, 825, 560, 825, 795, 1249.75, 795 ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "strobe-payload-gate",
                        0
                    ],
                    "destination": [
                        "payload-dict-pack",
                        2
                    ],
                    "midpoints": [ 1089.5, 710, 1090, 710, 1090, 795, 823.5, 795 ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "strobe-payload-gate",
                        1
                    ],
                    "destination": [
                        "strobe-payload-pack",
                        2
                    ],
                    "midpoints": [ 1135.5, 710, 1135, 710, 1135, 795, 1370, 795 ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "strobe-payload-pack",
                        0
                    ],
                    "destination": [
                        "event-dict-pack",
                        3
                    ],
                    "midpoints": [ 1129.5, 830, 1130, 830, 1130, 925, 485.25, 925 ]
                }
            },
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
                    "destination": [ "json-view", 0 ],
                    "source": [ "event-dict-pack", 0 ],
                    "midpoints": [ 49.5, 960, 50, 960, 50, 995, 49.5, 995 ]
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
                    "order": 1,
                    "source": [ "json-view", 0 ],
                    "midpoints": [ 49.5, 1030, 50, 1030, 50, 1055, 49.5, 1055 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "print-output", 0 ],
                    "order": 0,
                    "source": [ "json-view", 0 ],
                    "midpoints": [ 49.5, 1030, 50, 1030, 50, 1055, 149.5, 1055 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "event-dict-pack", 3 ],
                    "source": [ "payload-dict-pack", 0 ],
                    "midpoints": [ 549.5, 830, 485, 830, 485, 925, 485.25, 925 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "event-dict-pack", 2 ],
                    "midpoints": [ 436.3888888888889, 560, 435, 560, 435, 925, 340, 925 ],
                    "source": [ "route-fields", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "event-dict-pack", 1 ],
                    "midpoints": [ 242.94444444444446, 560, 245, 560, 245, 925, 194.75, 925 ],
                    "source": [ "route-fields", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "event-dict-pack", 0 ],
                    "midpoints": [ 49.5, 560, 50, 560, 50, 925, 49.5, 925 ],
                    "source": [ "route-fields", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "strobe-payload-gate",
                        1
                    ],
                    "source": [
                        "route-fields",
                        5
                    ],
                    "midpoints": [ 1016.7222222222222, 560, 1015, 560, 1015, 675, 1135.5, 675 ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "payload-dict-pack",
                        1
                    ],
                    "midpoints": [ 823.2777777777778, 560, 825, 560, 825, 795, 686.5, 795 ],
                    "source": [
                        "route-fields",
                        4
                    ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "destination": [
                        "payload-dict-pack",
                        0
                    ],
                    "midpoints": [ 629.8333333333334, 560, 630, 560, 630, 795, 549.5, 795 ],
                    "source": [
                        "route-fields",
                        3
                    ],
                    "order": 0
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
                    "source": [ "torch-js", 0 ],
                    "midpoints": [ 49.5, 490, 50, 490, 50, 525, 49.5, 525 ]
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
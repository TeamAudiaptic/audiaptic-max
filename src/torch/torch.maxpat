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
                    "numinlets": 7,
                    "numoutlets": 7,
                    "outlettype": [ "", "", "", "", "", "", "" ],
                    "patching_rect": [ 40.0, 530.0, 1060.0, 22.0 ],
                    "text": "route schemaVersion type execTimestamp durationMs intensity transitionMs"
                }
            },
            {
                "box": {
                    "id": "payload-dict-pack",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 1,
                    "outlettype": [ "dictionary" ],
                    "patching_rect": [ 645.0, 650.0, 430.0, 22.0 ],
                    "text": "dict.pack durationMs: intensity: transitionMs: @triggers 2"
                }
            },
            {
                "box": {
                    "id": "payload-dict-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1100.0, 650.0, 200.0, 20.0 ],
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
                    "patching_rect": [ 40.0, 712.0, 600.0, 22.0 ],
                    "text": "dict.pack schemaVersion: type: execTimestamp: payload: @triggers 3"
                }
            },
            {
                "box": {
                    "id": "event-dict-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 680.0, 780.0, 600.0, 20.0 ],
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
                    "patching_rect": [ 40.0, 804.0, 180.0, 22.0 ],
                    "text": "dict.serialize @mode json"
                }
            },
            {
                "box": {
                    "id": "print-output",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 118.0, 866.0, 125.0, 22.0 ],
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
                    "patching_rect": [ 40.0, 862.0, 30.0, 30.0 ]
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
                    "patching_rect": [ 1320.0, 65.0, 300.0, 32.0 ],
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
                    "patching_rect": [ 1320.0, 105.0, 450.0, 20.0 ],
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
                    "patching_rect": [ 1320.0, 665.0, 420.0, 40.0 ],
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
                    "bgcolor": [ 0.12, 0.62, 0.48, 1.0 ],
                    "id": "ui-send-button",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1135.0, 220.0, 40.0, 40.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 330.0, 250.0, 64.0, 64.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "ui-send-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1135.0, 150.0, 65.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 400.0, 272.0, 48.0, 20.0 ],
                    "text": "SEND"
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
                    "patching_rect": [ 1320.0, 145.0, 480.0, 500.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.0, 0.0, 480.0, 500.0 ]
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
                    "destination": [ "json-view", 0 ],
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
                    "order": 1,
                    "source": [ "json-view", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "print-output", 0 ],
                    "order": 0,
                    "source": [ "json-view", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "event-dict-pack", 3 ],
                    "source": [ "payload-dict-pack", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "event-dict-pack", 2 ],
                    "midpoints": [ 394.5, 635.0, 340.0, 635.0 ],
                    "source": [ "route-fields", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "event-dict-pack", 1 ],
                    "midpoints": [ 219.0, 605.0, 191.75, 605.0 ],
                    "source": [ "route-fields", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "event-dict-pack", 0 ],
                    "midpoints": [ 43.5, 590.0, 43.5, 590.0 ],
                    "source": [ "route-fields", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "payload-dict-pack", 2 ],
                    "midpoints": [ 921.0, 620.0, 928.5, 620.0 ],
                    "source": [ "route-fields", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "payload-dict-pack", 1 ],
                    "midpoints": [ 745.5, 605.0, 791.5, 605.0 ],
                    "source": [ "route-fields", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "payload-dict-pack", 0 ],
                    "midpoints": [ 570.0, 590.0, 654.5, 590.0 ],
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

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
        "rect": [ 818.0, 217.0, 850.0, 470.0 ],
        "boxes": [
            {
                "box": {
                    "fontsize": 18.0,
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 15.0, 260.0, 27.0 ],
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
                    "patching_rect": [ 30.0, 80.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "duration-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 75.0, 85.0, 150.0, 20.0 ],
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
                    "patching_rect": [ 230.0, 85.0, 115.0, 22.0 ],
                    "text": "prepend duration"
                }
            },
            {
                "box": {
                    "comment": "Execution timestamp in milliseconds, or the symbol null",
                    "id": "timestamp-inlet",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 30.0, 135.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "timestamp-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 75.0, 140.0, 300.0, 20.0 ],
                    "text": "Inlet 2: exec timestamp (ms) or null"
                }
            },
            {
                "box": {
                    "id": "timestamp-message",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 230.0, 170.0, 125.0, 22.0 ],
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
                    "patching_rect": [ 30.0, 200.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "transition-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 75.0, 205.0, 170.0, 20.0 ],
                    "text": "Inlet 3: transition (ms)"
                }
            },
            {
                "box": {
                    "id": "transition-message",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 230.0, 230.0, 125.0, 22.0 ],
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
                    "patching_rect": [ 400.0, 80.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "send-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 445.0, 85.0, 170.0, 20.0 ],
                    "text": "Inlet 4: bang to send"
                }
            },
            {
                "box": {
                    "id": "torch-js",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 400.0, 155.0, 59.0, 22.0 ],
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
                    "patching_rect": [ 400.0, 195.0, 450.0, 22.0 ],
                    "text": "route schemaVersion type sentTimestamp execTimestamp durationMs transitionMs"
                }
            },
            {
                "box": {
                    "id": "payload-dict-pack",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "dictionary" ],
                    "patching_rect": [ 400.0, 235.0, 280.0, 22.0 ],
                    "text": "dict.pack durationMs: transitionMs: @triggers 1"
                }
            },
            {
                "box": {
                    "id": "payload-dict-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 690.0, 236.0, 165.0, 20.0 ],
                    "text": "Nested payload dictionary"
                }
            },
            {
                "box": {
                    "id": "event-dict-pack",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "dictionary" ],
                    "patching_rect": [ 400.0, 275.0, 467.0, 22.0 ],
                    "text": "dict.pack schemaVersion: type: sentTimestamp: execTimestamp: payload: @triggers 4"
                }
            },
            {
                "box": {
                    "id": "event-dict-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 400.0, 300.0, 472.0, 20.0 ],
                    "text": "Outer event dictionary: schemaVersion, type, sentTimestamp, execTimestamp, payload"
                }
            },
            {
                "box": {
                    "id": "json-view",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 400.0, 315.0, 180.0, 22.0 ],
                    "text": "dict.serialize @mode json"
                }
            },
            {
                "box": {
                    "id": "print-output",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 400.0, 355.0, 125.0, 22.0 ],
                    "text": "print torch-json"
                }
            },
            {
                "box": {
                    "comment": "Torch event dictionary: schemaVersion, type, sentTimestamp, execTimestamp, payload",
                    "id": "output",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 400.0, 395.0, 30.0, 30.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "duration-message", 0 ],
                    "source": [ "duration-inlet", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "torch-js", 0 ],
                    "source": [ "duration-message", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "json-view", 0 ],
                    "order": 1,
                    "source": [ "event-dict-pack", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "output", 0 ],
                    "order": 0,
                    "source": [ "event-dict-pack", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "print-output", 0 ],
                    "source": [ "json-view", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "event-dict-pack", 4 ],
                    "source": [ "payload-dict-pack", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "event-dict-pack", 3 ],
                    "source": [ "route-fields", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "event-dict-pack", 2 ],
                    "source": [ "route-fields", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "event-dict-pack", 1 ],
                    "source": [ "route-fields", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "event-dict-pack", 0 ],
                    "source": [ "route-fields", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "payload-dict-pack", 1 ],
                    "source": [ "route-fields", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "payload-dict-pack", 0 ],
                    "source": [ "route-fields", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "torch-js", 0 ],
                    "source": [ "send-inlet", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "timestamp-message", 0 ],
                    "source": [ "timestamp-inlet", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "torch-js", 0 ],
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
                    "source": [ "transition-inlet", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "torch-js", 0 ],
                    "source": [ "transition-message", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}
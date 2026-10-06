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
        "rect": [ 120.0, 120.0, 650.0, 310.0 ],
        "openinpresentation": 0,
        "boxes": [
            {
                "box": {
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 15.0, 260.0, 25.0 ],
                    "fontsize": 18.0,
                    "text": "Torch event (typed message)"
                }
            },
            {
                "box": {
                    "id": "duration-inlet",
                    "comment": "Duration in milliseconds",
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
                    "id": "timestamp-inlet",
                    "comment": "Execution timestamp in milliseconds, or the symbol null",
                    "index": 1,
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
                    "id": "transition-inlet",
                    "comment": "Transition duration in milliseconds",
                    "index": 2,
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
                    "id": "send-inlet",
                    "comment": "Send the event by sending a bang",
                    "index": 3,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
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
                    "patching_rect": [ 400.0, 155.0, 125.0, 22.0 ],
                    "text": "js torch-new.js"
                }
            },
            {
                "box": {
                    "id": "print-output",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 400.0, 200.0, 125.0, 22.0 ],
                    "text": "print torch-typed"
                }
            },
            {
                "box": {
                    "id": "output",
                    "comment": "torch durationMs execTimestamp transitionMs",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 400.0, 245.0, 30.0, 30.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "source": [ "duration-inlet", 0 ],
                    "destination": [ "duration-message", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "duration-message", 0 ],
                    "destination": [ "torch-js", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "timestamp-inlet", 0 ],
                    "destination": [ "timestamp-message", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "timestamp-message", 0 ],
                    "destination": [ "torch-js", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "transition-inlet", 0 ],
                    "destination": [ "transition-message", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "transition-message", 0 ],
                    "destination": [ "torch-js", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "send-inlet", 0 ],
                    "destination": [ "torch-js", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "torch-js", 0 ],
                    "destination": [ "print-output", 0 ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [ "torch-js", 0 ],
                    "destination": [ "output", 0 ],
                    "order": 1
                }
            }
        ],
        "autosave": 0
    }
}

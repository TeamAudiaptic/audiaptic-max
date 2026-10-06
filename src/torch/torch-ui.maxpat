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
        "rect": [ 140.0, 140.0, 720.0, 500.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "id": "background",
                    "maxclass": "panel",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 10.0, 10.0, 700.0, 470.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.0, 0.0, 480.0, 375.0 ],
                    "bgcolor": [ 0.12, 0.14, 0.17, 1.0 ],
                    "background": 1
                }
            },
            {
                "box": {
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 25.0, 300.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 24.0, 18.0, 360.0, 30.0 ],
                    "fontsize": 22.0,
                    "text": "DAVHI Torch"
                }
            },
            {
                "box": {
                    "id": "subtitle",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 60.0, 450.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 26.0, 52.0, 420.0, 20.0 ],
                    "text": "Set the event values, then send a torch event."
                }
            },
            {
                "box": {
                    "id": "duration-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 110.0, 150.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 28.0, 92.0, 180.0, 20.0 ],
                    "text": "Duration (ms)"
                }
            },
            {
                "box": {
                    "id": "duration-value",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 30.0, 135.0, 100.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 28.0, 116.0, 115.0, 28.0 ],
                    "value": 250
                }
            },
            {
                "box": {
                    "id": "timestamp-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 185.0, 250.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 28.0, 163.0, 320.0, 20.0 ],
                    "text": "Execution timestamp (Unix ms; optional)"
                }
            },
            {
                "box": {
                    "id": "timestamp-value",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 30.0, 210.0, 150.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 28.0, 188.0, 150.0, 28.0 ]
                }
            },
            {
                "box": {
                    "id": "use-delay",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 200.0, 210.0, 170.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 195.0, 188.0, 190.0, 28.0 ],
                    "text": "null",
                    "bgcolor": [ 0.20, 0.24, 0.28, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "use-delay-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 245.0, 380.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 28.0, 222.0, 420.0, 20.0 ],
                    "text": "Click “null” to let the connection’s universal delay apply."
                }
            },
            {
                "box": {
                    "id": "transition-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 280.0, 150.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 28.0, 252.0, 180.0, 20.0 ],
                    "text": "Transition (ms)"
                }
            },
            {
                "box": {
                    "id": "transition-value",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 30.0, 305.0, 100.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 28.0, 276.0, 115.0, 28.0 ],
                    "value": 0
                }
            },
            {
                "box": {
                    "id": "send-button",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 30.0, 360.0, 65.0, 65.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 330.0, 250.0, 64.0, 64.0 ],
                    "bgcolor": [ 0.12, 0.62, 0.48, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "send-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 110.0, 382.0, 190.0, 25.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 400.0, 272.0, 48.0, 20.0 ],
                    "fontsize": 12.0,
                    "text": "SEND"
                }
            },
            {
                "box": {
                    "id": "torch-abstraction",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 400.0, 135.0, 82.0, 22.0 ],
                    "text": "torch-new"
                }
            },
            {
                "box": {
                    "id": "output-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 400.0, 200.0, 250.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 28.0, 312.0, 120.0, 18.0 ],
                    "text": "Last event:"
                }
            },
            {
                "box": {
                    "id": "output-display",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 400.0, 230.0, 260.0, 28.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 28.0, 334.0, 420.0, 28.0 ],
                    "text": "torch 250 null 0",
                    "bgcolor": [ 0.20, 0.24, 0.28, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "display-set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 400.0, 265.0, 75.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "print-output",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 500.0, 265.0, 130.0, 22.0 ],
                    "text": "print torch-performer"
                }
            },
            {
                "box": {
                    "id": "event-outlet",
                    "comment": "torch durationMs execTimestamp transitionMs",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 400.0, 310.0, 30.0, 30.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "source": [ "duration-value", 0 ],
                    "destination": [ "torch-abstraction", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "timestamp-value", 0 ],
                    "destination": [ "torch-abstraction", 1 ]
                }
            },
            {
                "patchline": {
                    "source": [ "use-delay", 0 ],
                    "destination": [ "torch-abstraction", 1 ]
                }
            },
            {
                "patchline": {
                    "source": [ "transition-value", 0 ],
                    "destination": [ "torch-abstraction", 2 ]
                }
            },
            {
                "patchline": {
                    "source": [ "send-button", 0 ],
                    "destination": [ "torch-abstraction", 3 ]
                }
            },
            {
                "patchline": {
                    "source": [ "torch-abstraction", 0 ],
                    "destination": [ "display-set", 0 ],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": [ "display-set", 0 ],
                    "destination": [ "output-display", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "torch-abstraction", 0 ],
                    "destination": [ "print-output", 0 ],
                    "order": 1
                }
            },
            {
                "patchline": {
                    "source": [ "torch-abstraction", 0 ],
                    "destination": [ "event-outlet", 0 ],
                    "order": 2
                }
            }
        ],
        "autosave": 0
    }
}

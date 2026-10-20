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
        "rect": [ 588.0, 160.0, 720.0, 510.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "fontsize": 22.0,
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 25.0, 300.0, 32.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 24.0, 18.0, 360.0, 32.0 ],
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
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 30.0, 135.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 28.0, 116.0, 115.0, 22.0 ]
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
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 30.0, 210.0, 150.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 28.0, 188.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.2, 0.24, 0.28, 1 ],
                    "bgcolor2": [ 0.172137149796092, 0.172137100044002, 0.172137113045018, 1 ],
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.172137149796092, 0.172137100044002, 0.172137113045018, 1 ],
                    "bgfillcolor_color1": [ 0.2, 0.24, 0.28, 1 ],
                    "bgfillcolor_color2": [ 0.172137149796092, 0.172137100044002, 0.172137113045018, 1 ],
                    "bgfillcolor_type": "gradient",
                    "gradient": 1,
                    "id": "use-delay",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 200.0, 210.0, 170.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 195.0, 188.0, 190.0, 22.0 ],
                    "text": "null"
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
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 30.0, 305.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 28.0, 276.0, 115.0, 22.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.12, 0.62, 0.48, 1.0 ],
                    "id": "send-button",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 30.0, 360.0, 65.0, 65.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 330.0, 250.0, 64.0, 64.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "send-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 110.0, 382.0, 190.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 400.0, 272.0, 48.0, 20.0 ],
                    "text": "SEND"
                }
            },
            {
                "box": {
                    "id": "torch-abstraction",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 436.0, 145.0, 100.0, 22.0 ],
                    "text": "torch"
                }
            },
            {
                "box": {
                    "comment": "Torch event dictionary with durationMs, transitionMs, and intensity in payload",
                    "id": "event-outlet",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 400.0, 310.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "intensity-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 280.0, 170.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 175.0, 252.0, 140.0, 20.0 ],
                    "text": "Intensity (integer)"
                }
            },
            {
                "box": {
                    "id": "intensity-value",
                    "maxclass": "number",
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 200.0, 305.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 175.0, 276.0, 115.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "intensity-default",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 200.0, 335.0, 85.0, 22.0 ],
                    "text": "loadmess 0"
                }
            },
            {
                "box": {
                    "background": 1,
                    "bgcolor": [ 0.12, 0.14, 0.17, 1 ],
                    "id": "background",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 10.0, 10.0, 700.0, 470.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.0, 0.0, 480.0, 500.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "torch-abstraction", 0 ],
                    "source": [ "duration-value", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "intensity-value", 0 ],
                    "source": [ "intensity-default", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "torch-abstraction", 3 ],
                    "source": [ "intensity-value", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "torch-abstraction", 4 ],
                    "source": [ "send-button", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "torch-abstraction", 1 ],
                    "source": [ "timestamp-value", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "event-outlet", 0 ],
                    "source": [ "torch-abstraction", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "torch-abstraction", 2 ],
                    "source": [ "transition-value", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "torch-abstraction", 1 ],
                    "source": [ "use-delay", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}
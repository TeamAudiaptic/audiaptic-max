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
        "rect": [ 90.0, 90.0, 720.0, 470.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "fontsize": 20.0,
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 15.0, 390.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 15.0, 390.0, 30.0 ],
                    "text": "Caption event demo"
                }
            },
            {
                "box": {
                    "id": "help-text",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 50.0, 650.0, 38.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 50.0, 650.0, 38.0 ],
                    "text": "Edit text, duration, and execution time, then click Send to print caption JSON. Connection adds identity and sent time; execution time 0 uses its universal delay."
                }
            },
            {
                "box": {
                    "id": "caption-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 105.0, 100.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 105.0, 100.0, 20.0 ],
                    "text": "Caption text"
                }
            },
            {
                "box": {
                    "id": "caption-text",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 130.0, 350.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 130.0, 350.0, 22.0 ],
                    "text": "Follow the lights"
                }
            },
            {
                "box": {
                    "id": "duration-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 390.0, 105.0, 130.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 390.0, 105.0, 130.0, 20.0 ],
                    "text": "Duration (ms)"
                }
            },
            {
                "box": {
                    "id": "duration",
                    "maxclass": "number",
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 390.0, 130.0, 80.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 390.0, 130.0, 80.0, 22.0 ],
                    "value": 3000
                }
            },
            {
                "box": {
                    "id": "send-button",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 20.0, 240.0, 150.0, 36.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 240.0, 150.0, 36.0 ],
                    "text": "Send caption"
                }
            },
            {
                "box": {
                    "id": "caption-event",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 100.0, 450.0, 70.0, 22.0 ],
                    "text": "caption"
                }
            },
            {
                "box": {
                    "id": "send-order",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "bang", "bang", "bang" ],
                    "patching_rect": [ 480.0, 320.0, 70.0, 22.0 ],
                    "text": "t b b b"
                }
            },
            {
                "box": {
                    "id": "exec-timestamp-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 175.0, 280.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 175.0, 280.0, 20.0 ],
                    "text": "Execution time (Unix epoch ms)"
                }
            },
            {
                "box": {
                    "id": "exec-timestamp",
                    "maxclass": "number",
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "int", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 20.0, 199.0, 200.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 199.0, 200.0, 22.0 ],
                    "value": 0
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "send-order", 0 ],
                    "source": [ "send-button", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "exec-timestamp", 0 ],
                    "destination": [ "caption-event", 2 ]
                }
            },
            {
                "patchline": {
                    "source": [ "caption-text", 0 ],
                    "destination": [ "caption-event", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "duration", 0 ],
                    "destination": [ "caption-event", 1 ]
                }
            },
            {
                "patchline": {
                    "source": [ "send-order", 2 ],
                    "destination": [ "exec-timestamp", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "send-order", 1 ],
                    "destination": [ "duration", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "send-order", 0 ],
                    "destination": [ "caption-text", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}

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
        "rect": [ 100.0, 100.0, 650.0, 400.0 ],
        "openinpresentation": 1,
        "presentation": 1,
        "presentation_rect": [ 0.0, 0.0, 590.0, 240.0 ],
        "boxes": [
            {
                "box": {
                    "id": "background",
                    "maxclass": "panel",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 0.0, 0.0, 590.0, 240.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.0, 0.0, 590.0, 240.0 ],
                    "background": 1,
                    "bgcolor": [ 0.08, 0.08, 0.08, 1.0 ],
                    "mode": 0
                }
            },
            {
                "box": {
                    "id": "title",
                    "maxclass": "comment",
                    "fontsize": 20.0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 15.0, 250.0, 28.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 15.0, 250.0, 28.0 ],
                    "text": "Caption event"
                }
            },
            {
                "box": {
                    "id": "caption-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 56.0, 120.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 56.0, 120.0, 20.0 ],
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
                    "patching_rect": [ 20.0, 80.0, 360.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 80.0, 360.0, 22.0 ],
                    "text": "Follow the lights"
                }
            },
            {
                "box": {
                    "id": "duration-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 405.0, 56.0, 145.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 405.0, 56.0, 145.0, 20.0 ],
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
                    "patching_rect": [ 405.0, 80.0, 85.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 405.0, 80.0, 85.0, 22.0 ],
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
                    "patching_rect": [ 20.0, 185.0, 150.0, 36.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 185.0, 150.0, 36.0 ],
                    "text": "Send caption"
                }
            },
            {
                "box": {
                    "id": "payload-text-symbol",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "symbol" ],
                    "patching_rect": [ 20.0, 360.0, 60.0, 22.0 ],
                    "text": "tosymbol"
                }
            },
            {
                "box": {
                    "id": "payload-pack",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "dictionary" ],
                    "patching_rect": [ 100.0, 360.0, 220.0, 22.0 ],
                    "text": "dict.pack text: durationMs:"
                }
            },
            {
                "box": {
                    "id": "caption-event",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 100.0, 400.0, 70.0, 22.0 ],
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
                    "patching_rect": [ 480.0, 250.0, 65.0, 22.0 ],
                    "text": "t b b b"
                }
            },
            {
                "box": {
                    "id": "event-print",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 440.0, 90.0, 22.0 ],
                    "text": "print caption"
                }
            },
            {
                "box": {
                    "comment": "Caption JSON for connection to complete and send",
                    "id": "event-out",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 100.0, 440.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "exec-timestamp-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 120.0, 280.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 120.0, 280.0, 20.0 ],
                    "text": "Execution time (Unix epoch ms)"
                }
            },
            {
                "box": {
                    "id": "exec-timestamp",
                    "maxclass": "flonum",
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 20.0, 144.0, 200.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 144.0, 200.0, 22.0 ],
                    "value": 0.0
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
                    "destination": [ "duration", 0 ],
                    "source": [ "send-order", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "caption-text", 0 ],
                    "source": [ "send-order", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "payload-text-symbol", 0 ],
                    "source": [ "caption-text", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "payload-pack", 0 ],
                    "source": [ "payload-text-symbol", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "payload-pack", 1 ],
                    "source": [ "duration", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "caption-event", 0 ],
                    "source": [ "payload-pack", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "event-out", 0 ],
                    "order": 1,
                    "source": [ "caption-event", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "event-print", 0 ],
                    "order": 0,
                    "source": [ "caption-event", 0 ]
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
                    "source": [ "exec-timestamp", 0 ],
                    "destination": [ "caption-event", 1 ]
                }
            }
        ],
        "autosave": 0
    }
}

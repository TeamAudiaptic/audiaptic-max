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
                    "id": "payload-text-symbol",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "symbol" ],
                    "patching_rect": [ 20.0, 410.0, 60.0, 22.0 ],
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
                    "patching_rect": [ 100.0, 410.0, 220.0, 22.0 ],
                    "text": "dict.pack text: durationMs:"
                }
            },
            {
                "box": {
                    "id": "payload-store",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "dictionary", "" ],
                    "patching_rect": [ 350.0, 410.0, 40.0, 22.0 ],
                    "text": "dict"
                }
            },
            {
                "box": {
                    "id": "caption-event",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 100.0, 450.0, 70.0, 22.0 ],
                    "text": "caption"
                }
            },
            {
                "box": {
                    "id": "output-gate",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 200.0, 450.0, 55.0, 22.0 ],
                    "text": "gate 1"
                }
            },
            {
                "box": {
                    "id": "print-json",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 285.0, 450.0, 125.0, 22.0 ],
                    "text": "print caption-event"
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
                    "id": "refresh-inputs",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "bang", "bang", "bang" ],
                    "patching_rect": [ 480.0, 360.0, 65.0, 22.0 ],
                    "text": "t b b b"
                }
            },
            {
                "box": {
                    "id": "send-payload",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 480.0, 400.0, 55.0, 22.0 ],
                    "text": "t b b"
                }
            },
            {
                "box": {
                    "id": "open-output",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 590.0, 360.0, 30.0, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "close-output",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 630.0, 400.0, 30.0, 22.0 ],
                    "text": "0"
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
                    "maxclass": "flonum",
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 20.0, 199.0, 200.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 199.0, 200.0, 22.0 ],
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
                    "destination": [ "refresh-inputs", 0 ],
                    "source": [ "send-order", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "open-output", 0 ],
                    "source": [ "send-order", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "send-payload", 0 ],
                    "source": [ "send-order", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "duration", 0 ],
                    "source": [ "refresh-inputs", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "caption-text", 0 ],
                    "source": [ "refresh-inputs", 0 ]
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
                    "destination": [ "payload-store", 0 ],
                    "source": [ "payload-pack", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "payload-store", 0 ],
                    "source": [ "send-payload", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "caption-event", 0 ],
                    "source": [ "payload-store", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "close-output", 0 ],
                    "source": [ "send-payload", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "output-gate", 1 ],
                    "source": [ "open-output", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "output-gate", 1 ],
                    "source": [ "close-output", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "print-json", 0 ],
                    "source": [ "output-gate", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "output-gate", 0 ],
                    "source": [ "caption-event", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "refresh-inputs", 2 ],
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

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
        "rect": [ 709.0, 114.0, 526.0, 637.0 ],
        "openinpresentation": 1,
        "toolbars_unpinned_last_save": 4,
        "boxes": [
            {
                "box": {
                    "id": "obj-76",
                    "linecount": 27,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 458.0, 549.0, 50.0, 381.0 ],
                    "text": "\"{\r\n    \\\"payload\\\": {\r\n        \\\"color\\\": \\\"#fff22f\\\",\r\n        \\\"durationMs\\\": 1000,\r\n        \\\"transitionMs\\\": 0\r\n    },\r\n    \\\"schemaVersion\\\": \\\"1.0\\\",\r\n    \\\"type\\\": \\\"color\\\"\r\n}\""
                }
            },
            {
                "box": {
                    "id": "obj-74",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 619.0, 590.0, 32.0, 22.0 ],
                    "text": "print"
                }
            },
            {
                "box": {
                    "id": "obj-71",
                    "maxclass": "swatch",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 51.0, 255.0, 128.0, 32.0 ],
                    "saturation": 0.0
                }
            },
            {
                "box": {
                    "id": "obj-70",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 251.0, 193.0, 97.0, 22.0 ],
                    "text": "scale 0 255 0. 1."
                }
            },
            {
                "box": {
                    "id": "obj-69",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 134.0, 193.0, 97.0, 22.0 ],
                    "text": "scale 0 255 0. 1."
                }
            },
            {
                "box": {
                    "id": "obj-68",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 18.0, 193.0, 97.0, 22.0 ],
                    "text": "scale 0 255 0. 1."
                }
            },
            {
                "box": {
                    "id": "obj-63",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 61.0, 318.0, 107.0, 22.0 ],
                    "text": "prepend bgfillcolor"
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0.0, 0.0, 0.0, 1.0 ],
                    "id": "obj-61",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 18.0, 65.0, 186.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 13.0, 62.0, 174.0, 20.0 ],
                    "proportion": 0.39
                }
            },
            {
                "box": {
                    "id": "obj-51",
                    "maxclass": "number",
                    "maximum": 255,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 154.0, 34.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 137.0, 33.0, 50.0, 22.0 ],
                    "textcolor": [ 0.0, 0.047058823529411764, 1.0, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-50",
                    "maxclass": "number",
                    "maximum": 255,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 82.0, 34.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 75.0, 33.0, 50.0, 22.0 ],
                    "textcolor": [ 0.0, 1.0, 0.011764705882352941, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-47",
                    "maxclass": "number",
                    "maximum": 255,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 18.0, 34.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 13.0, 33.0, 50.0, 22.0 ],
                    "textcolor": [ 1.0, 0.0, 0.0, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-39",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 161.0, 12.0, 37.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 144.0, 11.0, 37.0, 20.0 ],
                    "text": "Blue",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "id": "obj-40",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 83.0, 12.0, 49.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 76.0, 11.0, 49.0, 20.0 ],
                    "text": "Green",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "id": "obj-42",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 22.0, 12.0, 42.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 17.0, 11.0, 42.0, 20.0 ],
                    "text": "Red",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 518.5, 187.0, 101.0, 22.0 ],
                    "text": "sprintf #%x%x%x"
                }
            },
            {
                "box": {
                    "id": "obj-19",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 401.0, 133.0, 70.0, 20.0 ],
                    "text": "Activation"
                }
            },
            {
                "box": {
                    "id": "obj-18",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 645.0, 20.0, 37.0, 20.0 ],
                    "text": "Blue"
                }
            },
            {
                "box": {
                    "id": "obj-16",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 585.0, 20.0, 49.0, 20.0 ],
                    "text": "Green"
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 524.0, 20.0, 42.0, 20.0 ],
                    "text": "Red"
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 542.0, 308.0, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-43",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 645.0, 360.0, 35.0, 22.0 ],
                    "text": "color"
                }
            },
            {
                "box": {
                    "id": "obj-41",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 542.0, 365.0, 34.0, 22.0 ],
                    "text": "\"1.0\""
                }
            },
            {
                "box": {
                    "id": "obj-38",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 509.0, 502.0, 145.0, 22.0 ],
                    "text": "dict.serialize @mode json"
                }
            },
            {
                "box": {
                    "id": "obj-33",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 421.0, 230.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-28",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 1,
                    "outlettype": [ "dictionary" ],
                    "patching_rect": [ 509.0, 415.0, 252.0, 22.0 ],
                    "text": "dict.pack color payload: schemaVersion: type:"
                }
            },
            {
                "box": {
                    "id": "obj-20",
                    "linecount": 2,
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 1,
                    "outlettype": [ "dictionary" ],
                    "patching_rect": [ 509.0, 259.0, 252.0, 36.0 ],
                    "text": "dict.pack payload color: #000000 durationMs: 1000 transitionMs: 0"
                }
            },
            {
                "box": {
                    "annotation": "Activation (bang)",
                    "comment": "Activation (send Bang to trigger event)",
                    "hint": "",
                    "id": "obj-10",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 421.0, 155.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "annotation": "Color event JSON string",
                    "comment": "",
                    "id": "obj-6",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 421.0, 640.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "annotation": "Blue (0-255)",
                    "comment": "Blue",
                    "hint": "",
                    "id": "obj-5",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 645.0, 47.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "annotation": "Green (0-255)",
                    "comment": "Green",
                    "hint": "",
                    "id": "obj-4",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 585.0, 47.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "annotation": "Red (0-255)",
                    "comment": "Red",
                    "hint": "",
                    "id": "obj-3",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 524.0, 47.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "background": 1,
                    "id": "obj-59",
                    "maxclass": "panel",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 4.0, 5.0, 218.0, 103.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.0, 0.0, 201.0, 89.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-33", 0 ],
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20", 0 ],
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-28", 0 ],
                    "source": [ "obj-20", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-38", 0 ],
                    "source": [ "obj-28", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-47", 0 ],
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-76", 0 ],
                    "source": [ "obj-33", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-76", 1 ],
                    "source": [ "obj-38", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-50", 0 ],
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-28", 1 ],
                    "source": [ "obj-41", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-28", 2 ],
                    "source": [ "obj-43", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "order": 0,
                    "source": [ "obj-47", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-68", 0 ],
                    "order": 1,
                    "source": [ "obj-47", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-51", 0 ],
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 1 ],
                    "order": 0,
                    "source": [ "obj-50", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-69", 0 ],
                    "order": 1,
                    "source": [ "obj-50", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 2 ],
                    "order": 0,
                    "source": [ "obj-51", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-70", 0 ],
                    "order": 1,
                    "source": [ "obj-51", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-61", 0 ],
                    "source": [ "obj-63", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-71", 0 ],
                    "source": [ "obj-68", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-71", 1 ],
                    "source": [ "obj-69", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-71", 2 ],
                    "source": [ "obj-70", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-63", 0 ],
                    "source": [ "obj-71", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "order": 1,
                    "source": [ "obj-76", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-74", 0 ],
                    "order": 0,
                    "source": [ "obj-76", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-41", 0 ],
                    "order": 1,
                    "source": [ "obj-9", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-43", 0 ],
                    "order": 0,
                    "source": [ "obj-9", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}
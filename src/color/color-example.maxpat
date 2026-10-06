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
        "rect": [ 703.0, 84.0, 526.0, 697.0 ],
        "boxes": [
            {
                "box": {
                    "id": "obj-63",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 242.0, 627.0, 85.0, 22.0 ],
                    "text": "prepend event"
                }
            },
            {
                "box": {
                    "id": "obj-58",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 412.0, 117.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-54",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 445.0, 169.0, 97.0, 22.0 ],
                    "text": "scale 0. 1. 0 255"
                }
            },
            {
                "box": {
                    "id": "obj-53",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "int", "int" ],
                    "patching_rect": [ 445.0, 208.0, 65.0, 22.0 ],
                    "text": "unpack i i i"
                }
            },
            {
                "box": {
                    "id": "obj-51",
                    "maxclass": "swatch",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 468.0, 113.0, 128.0, 32.0 ],
                    "saturation": 1.0
                }
            },
            {
                "box": {
                    "id": "obj-48",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 202.0, 125.0, 150.0, 20.0 ],
                    "text": "Toggle Random Input"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-46",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "color.maxpat",
                    "numinlets": 4,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "" ],
                    "patching_rect": [ 238.0, 309.0, 202.0, 91.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "obj-37",
                    "linecount": 4,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 242.0, 926.0, 198.0, 64.0 ],
                    "text": "{\\\"payload\\\":{\\\"color\\\":\\\"#fffe8\\\"\\,\\\"durationMs\\\":1000\\,\\\"transitionMs\\\":0}\\,\\\"schemaVersion\\\":\\\"1.0\\\"\\,\\\"type\\\":\\\"color\\\"}"
                }
            },
            {
                "box": {
                    "id": "obj-35",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 872.0, 976.0, 100.0, 48.0 ],
                    "text": "LET ME SCROLL FURTHER"
                }
            },
            {
                "box": {
                    "code": "inlets = 1;\r\noutlets = 1;\r\n\r\nfunction event(e) {\r\n    json = JSON.parse(e);\r\n    jsonStr = JSON.stringify(json);\r\n    outlet(0, jsonStr);\r\n}\r\n\r\nfunction bang() {\r\n    post(\"hello world\");\r\n    post();\r\n    outlet(0, \"hello outlet\");\r\n}",
                    "filename": "none",
                    "fontface": 0,
                    "fontname": "<Monospaced>",
                    "fontsize": 12.0,
                    "id": "obj-34",
                    "maxclass": "v8.codebox",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 242.0, 675.0, 340.0, 200.0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0
                    }
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
                    "patching_rect": [ 115.0, 211.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-24",
                    "linecount": 9,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 458.0, 203.0, 133.0 ],
                    "text": "\"{\r\n    \\\"payload\\\": {\r\n        \\\"color\\\": \\\"#fffe8\\\",\r\n        \\\"durationMs\\\": 1000,\r\n        \\\"transitionMs\\\": 0\r\n    },\r\n    \\\"schemaVersion\\\": \\\"1.0\\\",\r\n    \\\"type\\\": \\\"color\\\"\r\n}\""
                }
            },
            {
                "box": {
                    "id": "obj-22",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 332.0, 212.0, 73.0, 22.0 ],
                    "text": "random 255"
                }
            },
            {
                "box": {
                    "id": "obj-20",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 251.0, 212.0, 73.0, 22.0 ],
                    "text": "random 255"
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 167.0, 212.0, 73.0, 22.0 ],
                    "text": "random 255"
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 169.0, 123.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 169.0, 166.0, 69.0, 22.0 ],
                    "text": "metro 1000"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "order": 2,
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20", 0 ],
                    "order": 1,
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-22", 0 ],
                    "order": 0,
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-33", 0 ],
                    "order": 3,
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 0 ],
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 1 ],
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 2 ],
                    "source": [ "obj-20", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 3 ],
                    "source": [ "obj-22", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "source": [ "obj-33", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-37", 1 ],
                    "order": 0,
                    "source": [ "obj-34", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-37", 0 ],
                    "order": 1,
                    "source": [ "obj-34", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-24", 1 ],
                    "order": 0,
                    "source": [ "obj-46", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-24", 0 ],
                    "order": 1,
                    "source": [ "obj-46", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-63", 0 ],
                    "order": 2,
                    "source": [ "obj-46", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-54", 0 ],
                    "source": [ "obj-51", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 3 ],
                    "source": [ "obj-53", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 2 ],
                    "source": [ "obj-53", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 1 ],
                    "source": [ "obj-53", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-53", 0 ],
                    "source": [ "obj-54", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "source": [ "obj-58", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-34", 0 ],
                    "source": [ "obj-63", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}
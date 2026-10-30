{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 2,
            "revision": 0,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [ 814.0, 275.0, 941.0, 575.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "id": "obj-31",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 449.0, -100.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-16",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 449.0, -71.0, 35.0, 22.0 ],
                    "text": "clear"
                }
            },
            {
                "box": {
                    "id": "obj-55",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 231.0, 154.0, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "obj-53",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 552.0, -25.0, 73.0, 34.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 196.0, 58.0, 91.75, 20.0 ],
                    "text": "< Manual Entry",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "id": "obj-51",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 316.0, -7.0, 73.0, 34.0 ],
                    "text": "Asset Alias List",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "comment": "asset alias list",
                    "id": "obj-50",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 337.0, 29.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-47",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 138.0, 110.0, 92.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 198.0, 33.0, 89.875, 21.5 ],
                    "text": "Clear Options",
                    "textoncolor": [ 0.7764705882352941, 0.17254901960784313, 0.09803921568627451, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-35",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 138.0, 162.0, 35.0, 22.0 ],
                    "text": "clear"
                }
            },
            {
                "box": {
                    "id": "obj-21",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 344.0, 154.0, 96.0, 22.0 ],
                    "text": "prepend append"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.12549019607843137, 0.13333333333333333, 0.13333333333333333, 1.0 ],
                    "bgfillcolor_angle": 270.0,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.12549019607843137, 0.13333333333333333, 0.13333333333333333, 1.0 ],
                    "bgfillcolor_color1": [ 0.17213714979609188, 0.1721371000440022, 0.17213711304501805, 1.0 ],
                    "bgfillcolor_color2": [ 0.17213714979609188, 0.1721371000440022, 0.17213711304501805, 1.0 ],
                    "bgfillcolor_proportion": 0.5,
                    "bgfillcolor_type": "color",
                    "id": "obj-3",
                    "items": "<empty>",
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 285.0, 227.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 11.0, 33.0, 182.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-52",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 449.0, 76.0, 66.0, 22.0 ],
                    "text": "route bang"
                }
            },
            {
                "box": {
                    "id": "obj-42",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 449.0, 37.0, 59.0, 22.0 ],
                    "text": "route text"
                }
            },
            {
                "box": {
                    "id": "obj-22",
                    "keymode": 1,
                    "lines": 1,
                    "maxclass": "textedit",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "int", "", "" ],
                    "outputmode": 1,
                    "parameter_enable": 0,
                    "patching_rect": [ 449.0, -25.0, 92.0, 46.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 9.0, 57.0, 184.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-74",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 88.0, 600.0, 32.0, 22.0 ],
                    "text": "print"
                }
            },
            {
                "box": {
                    "annotation": "Image event JSON string",
                    "comment": "",
                    "id": "obj-6",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 152.0, 596.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 7.0, 268.0, 101.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 9.0, 137.0, 279.0, 20.0 ],
                    "rounded": 5.0,
                    "text": "Send"
                }
            },
            {
                "box": {
                    "id": "obj-19",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 112.0, 246.0, 70.0, 20.0 ],
                    "text": "Activation",
                    "textjustification": 1
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
                    "patching_rect": [ 132.0, 331.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "annotation": "",
                    "comment": "Activation (send Bang to trigger event)",
                    "hint": "",
                    "id": "obj-10",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 132.0, 268.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-76",
                    "linecount": 10,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 123.0, 431.0, 205.5, 146.0 ],
                    "text": "\"{\r\n    \\\"payload\\\": {\r\n        \\\"assetAlias\\\": \\\"test.jpg\\\",\r\n        \\\"durationMs\\\": 500,\r\n        \\\"transitionMs\\\": 0\r\n    },\r\n    \\\"schemaVersion\\\": \\\"1.0\\\",\r\n    \\\"type\\\": \\\"image\\\",\r\n    \\\"relativeTimestamp\\\": 0\r\n}\""
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 687.0, 272.0, 58.0, 22.0 ],
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
                    "patching_rect": [ 774.0, 313.0, 41.0, 22.0 ],
                    "text": "image"
                }
            },
            {
                "box": {
                    "id": "obj-41",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 687.0, 313.0, 34.0, 22.0 ],
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
                    "patching_rect": [ 600.0, 393.0, 145.0, 22.0 ],
                    "text": "dict.serialize @mode json"
                }
            },
            {
                "box": {
                    "id": "obj-28",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 1,
                    "outlettype": [ "dictionary" ],
                    "patching_rect": [ 600.0, 348.0, 366.0, 22.0 ],
                    "text": "dict.pack color payload: schemaVersion: type: relativeTimestamp: 0"
                }
            },
            {
                "box": {
                    "id": "obj-20",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 1,
                    "outlettype": [ "dictionary" ],
                    "patching_rect": [ 601.0, 238.0, 320.0, 22.0 ],
                    "text": "dict.pack payload assetAlias: durationMs: 0 transitionMs: 0"
                }
            },
            {
                "box": {
                    "id": "obj-18",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 601.0, 177.0, 35.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-24",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 870.0, 78.0, 102.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 205.0, 87.0, 73.0, 20.0 ],
                    "text": "Timestamp",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "annotation": "timestamp",
                    "id": "obj-17",
                    "maxclass": "number",
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 906.0, 176.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 217.0, 109.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "comment": "Timestamp",
                    "id": "obj-14",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 906.0, 105.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "annotation": "transition",
                    "id": "obj-36",
                    "maxclass": "number",
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 802.0, 177.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 124.0, 109.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "annotation": "duration",
                    "id": "obj-34",
                    "maxclass": "number",
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 701.0, 177.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 28.0, 109.0, 50.0, 22.0 ],
                    "textcolor": [ 0.9019607843137255, 0.9019607843137255, 0.9019607843137255, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-30",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 772.0, 78.0, 89.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 105.0, 87.0, 89.0, 20.0 ],
                    "text": "Transition MS",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "id": "obj-29",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 675.0, 78.0, 81.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 12.0, 87.0, 81.0, 20.0 ],
                    "text": "Duration MS",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "comment": "Transition MS",
                    "id": "obj-26",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 802.0, 105.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "Duration MS",
                    "id": "obj-25",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 701.0, 105.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 579.0, 78.0, 73.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 11.0, 11.0, 77.0, 20.0 ],
                    "text": "Asset Alias"
                }
            },
            {
                "box": {
                    "comment": "assetAlias",
                    "id": "obj-5",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 601.0, 105.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "background": 1,
                    "id": "obj-59",
                    "maxclass": "panel",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 7.0, -27.0, 203.0, 38.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.0, 0.0, 299.0, 168.0 ]
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
                    "destination": [ "obj-17", 0 ],
                    "source": [ "obj-14", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-22", 0 ],
                    "source": [ "obj-16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-28", 3 ],
                    "source": [ "obj-17", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20", 0 ],
                    "order": 0,
                    "source": [ "obj-18", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-21", 0 ],
                    "order": 1,
                    "source": [ "obj-18", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-55", 0 ],
                    "order": 2,
                    "source": [ "obj-18", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-33", 0 ],
                    "source": [ "obj-2", 0 ]
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
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-21", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-42", 0 ],
                    "source": [ "obj-22", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-34", 0 ],
                    "source": [ "obj-25", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-36", 0 ],
                    "source": [ "obj-26", 0 ]
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
                    "destination": [ "obj-18", 1 ],
                    "order": 0,
                    "source": [ "obj-3", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 0 ],
                    "order": 1,
                    "source": [ "obj-3", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 0 ],
                    "source": [ "obj-31", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20", 0 ],
                    "order": 0,
                    "source": [ "obj-33", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-76", 0 ],
                    "order": 1,
                    "source": [ "obj-33", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20", 1 ],
                    "source": [ "obj-34", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-35", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20", 2 ],
                    "source": [ "obj-36", 0 ]
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
                    "destination": [ "obj-28", 1 ],
                    "source": [ "obj-41", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-52", 0 ],
                    "source": [ "obj-42", 0 ]
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
                    "destination": [ "obj-35", 0 ],
                    "source": [ "obj-47", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 1 ],
                    "order": 0,
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 0 ],
                    "order": 1,
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-21", 0 ],
                    "source": [ "obj-50", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 1 ],
                    "order": 0,
                    "source": [ "obj-52", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 0 ],
                    "order": 1,
                    "source": [ "obj-52", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-31", 0 ],
                    "order": 2,
                    "source": [ "obj-52", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-55", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "order": 0,
                    "source": [ "obj-76", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-74", 0 ],
                    "order": 1,
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
        "autosave": 0,
        "oscreceiveudpport": 0
    }
}
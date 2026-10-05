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
        "rect": [ 2571.0, 116.0, 1029.0, 1228.0 ],
        "boxes": [
            {
                "box": {
                    "comment": "",
                    "id": "obj-8",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 111.0, 495.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 215.0, 450.0, 32.0, 22.0 ],
                    "text": "print"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 111.0, 381.0, 194.5, 22.0 ],
                    "text": "haptic"
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 321.5, 190.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 321.0, 191.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-58",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 243.5, 190.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 243.5, 191.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-40",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 37.0, 164.0, 162.0, 39.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 37.0, 164.0, 162.0, 39.0 ],
                    "text": "Send"
                }
            },
            {
                "box": {
                    "id": "obj-37",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 93.0, 121.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 93.0, 121.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-35",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 11.0, 122.0, 80.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 11.0, 122.0, 80.0, 20.0 ],
                    "text": "Transition"
                }
            },
            {
                "box": {
                    "id": "obj-32",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 93.0, 90.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 93.0, 90.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-30",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 11.0, 91.0, 80.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 11.0, 91.0, 80.0, 20.0 ],
                    "text": "Timestamp"
                }
            },
            {
                "box": {
                    "id": "obj-26",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 93.0, 60.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 93.0, 60.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-24",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 11.0, 61.0, 80.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 11.0, 61.0, 80.0, 20.0 ],
                    "text": "Duration"
                }
            },
            {
                "box": {
                    "id": "obj-21",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 258.0, 44.0, 21.0, 144.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 258.0, 44.0, 21.0, 145.0 ],
                    "size": 101.0
                }
            },
            {
                "box": {
                    "id": "obj-20",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 310.0, 12.5, 72.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 310.0, 12.5, 72.0, 20.0 ],
                    "text": "Sharpness"
                }
            },
            {
                "box": {
                    "id": "obj-18",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 239.0, 12.5, 58.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 239.0, 12.5, 58.0, 20.0 ],
                    "text": "Intensity"
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 336.0, 44.0, 21.0, 144.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 336.0, 44.0, 21.0, 145.0 ],
                    "size": 101.0
                }
            },
            {
                "box": {
                    "fontsize": 18.0,
                    "id": "obj-11",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 11.0, 9.0, 207.0, 27.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 11.0, 9.0, 207.0, 27.0 ],
                    "text": "DAVHI Haptic"
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "panel",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ -1.0, -2.0, 418.0, 226.0 ],
                    "presentation": 1,
                    "presentation_rect": [ -1.0, -2.0, 418.0, 226.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "order": 0,
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 2 ],
                    "order": 1,
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 1 ],
                    "order": 1,
                    "source": [ "obj-21", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-58", 0 ],
                    "order": 0,
                    "source": [ "obj-21", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 3 ],
                    "source": [ "obj-26", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 4 ],
                    "source": [ "obj-32", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 5 ],
                    "source": [ "obj-37", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "order": 0,
                    "source": [ "obj-40", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-21", 0 ],
                    "order": 1,
                    "source": [ "obj-40", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-26", 0 ],
                    "order": 5,
                    "source": [ "obj-40", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-32", 0 ],
                    "order": 4,
                    "source": [ "obj-40", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-37", 0 ],
                    "order": 3,
                    "source": [ "obj-40", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "order": 2,
                    "source": [ "obj-40", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "order": 0,
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "order": 1,
                    "source": [ "obj-5", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}
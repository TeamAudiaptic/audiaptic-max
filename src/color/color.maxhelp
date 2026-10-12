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
        "rect": [ 168.0, 129.0, 1004.0, 653.0 ],
        "boxes": [
            {
                "box": {
                    "bubble": 1,
                    "bubbleside": 2,
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-29",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 748.0, 239.0, 151.0, 55.0 ],
                    "presentation_linecount": 4,
                    "text": "Can resize to only see desired information",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-28",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "color.maxpat",
                    "numinlets": 7,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "" ],
                    "patching_rect": [ 727.0, 296.0, 193.0, 93.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "bubble": 1,
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-26",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 541.0, 495.0, 213.0, 25.0 ],
                    "presentation_linecount": 2,
                    "text": "Manually set when to start event",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "id": "obj-24",
                    "linecount": 10,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 33.0, 77.0, 543.0, 158.0 ],
                    "text": "Generates a color event to be sent to the DAVHI Connection patch. The event payload can be set manually in the patch UI, or provided through the inlets. The event is sent out (as JSON) when a signal is sent to the Activation inlet, or the Send button is pressed.\n\nInputs:\nActivation: send the color event\nRed, Green, and Blue: color values (int, 0-255)\nDuration: how long the color event will last, (positive int, milliseconds), 0 = until changed\nTransition Time: how long to fade between the current color and this one (positive int, milliseconds)\nExec Timestamp: when to execute the event (positive int, milliseconds), 0 = ASAP\n"
                }
            },
            {
                "box": {
                    "fontsize": 32.0,
                    "id": "obj-22",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 33.0, 32.0, 345.0, 43.0 ],
                    "text": "Color"
                }
            },
            {
                "box": {
                    "bubble": 1,
                    "bubbleside": 2,
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-19",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 590.0, 252.0, 78.0, 55.0 ],
                    "presentation_linecount": 3,
                    "text": "Exec Timestamp",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "bubble": 1,
                    "bubbleside": 2,
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-18",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 517.0, 239.0, 69.73333333333335, 70.0 ],
                    "presentation_linecount": 3,
                    "text": "Transition Time (MS)",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 604.0, 309.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 567.0, 199.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "bubble": 1,
                    "bubbleside": 2,
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-16",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 444.0, 252.0, 62.5333333333333, 55.0 ],
                    "text": "Duration (MS)",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "bubble": 1,
                    "bubbleside": 2,
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-15",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 258.0, 246.0, 121.0, 55.0 ],
                    "presentation_linecount": 2,
                    "text": "Set RGB values (limited to 0-255)",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "id": "obj-36",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 527.0, 309.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 314.5, 46.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 450.0, 309.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 230.5, 46.0, 50.0, 22.0 ],
                    "textcolor": [ 0.9019607843137255, 0.9019607843137255, 0.9019607843137255, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-51",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 374.0, 309.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 149.0, 49.0, 50.0, 22.0 ],
                    "textcolor": [ 0.0, 0.047058823529411764, 1.0, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-50",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 297.0, 309.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 87.0, 49.0, 50.0, 22.0 ],
                    "textcolor": [ 0.0, 1.0, 0.011764705882352941, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-47",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 221.0, 309.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 25.0, 49.0, 50.0, 22.0 ],
                    "textcolor": [ 1.0, 0.0, 0.0, 1.0 ]
                }
            },
            {
                "box": {
                    "bubble": 1,
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-11",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 541.0, 460.0, 175.0, 25.0 ],
                    "text": "Manually send message",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "bubble": 1,
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-10",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 541.0, 420.0, 213.0, 25.0 ],
                    "text": "Preview or manually set fields",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "bubble": 1,
                    "bubbleside": 3,
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-9",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 33.0, 487.0, 126.0, 40.0 ],
                    "presentation_linecount": 3,
                    "text": "Can set color with color picker",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "bubble": 1,
                    "bubbleside": 3,
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-8",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 48.0, 448.0, 111.0, 25.0 ],
                    "presentation_linecount": 2,
                    "text": "Color preview",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "bubble": 1,
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-6",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 357.0, 577.0, 213.0, 40.0 ],
                    "presentation_linecount": 7,
                    "text": "Outputs event as JSON that's sent to the Connection patch",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "linecount": 10,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 161.0, 586.0, 194.0, 146.0 ],
                    "text": "\"{\r\n    \\\"payload\\\": {\r\n        \\\"color\\\": \\\"#000000\\\",\r\n        \\\"durationMs\\\": 0,\r\n        \\\"transitionMs\\\": 0,\r\n        \\\"execTimestamp\\\": 0\r\n    },\r\n    \\\"schemaVersion\\\": \\\"1.0\\\",\r\n    \\\"type\\\": \\\"color\\\"\r\n}\""
                }
            },
            {
                "box": {
                    "bubble": 1,
                    "bubbleside": 3,
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-34",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 47.0, 308.0, 112.5, 25.0 ],
                    "text": "Send message",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 161.0, 308.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-1",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "color.maxpat",
                    "numinlets": 7,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "" ],
                    "patching_rect": [ 161.0, 392.0, 378.0, 145.0 ],
                    "viewvisibility": 1
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-3", 1 ],
                    "order": 0,
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "order": 1,
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 4 ],
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 6 ],
                    "source": [ "obj-17", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 5 ],
                    "source": [ "obj-36", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 1 ],
                    "source": [ "obj-47", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 2 ],
                    "source": [ "obj-50", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 3 ],
                    "source": [ "obj-51", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}
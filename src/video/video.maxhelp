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
        "rect": [ 127.0, 131.0, 1285.0, 612.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "bubble": 1,
                    "bubbleside": 2,
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-27",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 716.7469879518072, 359.03614457831327, 67.0, 40.0 ],
                    "text": "Loop?",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "id": "obj-26",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 738.433734939759, 400.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "bubble": 1,
                    "bubbleside": 2,
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-1",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 614.3373493975904, 344.5783132530121, 84.0, 55.0 ],
                    "presentation_linecount": 3,
                    "text": "Start Offset (MS)",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 631.2048192771084, 400.0, 50.0, 22.0 ]
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
                    "patching_rect": [ 137.2289156626506, 534.9397590361446, 162.0, 25.0 ],
                    "text": "Manually set the asset",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "bubble": 1,
                    "bubbleside": 3,
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 110.72289156626506, 508.43373493975906, 188.0, 25.0 ],
                    "text": "Select asset from dropdown",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "bubble": 1,
                    "bubbleside": 2,
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-4",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 244.4578313253012, 300.0, 155.0, 70.0 ],
                    "text": "Append options to the dropdown with a comma seperated list",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "linecount": 3,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 284.21686746987956, 371.08433734939763, 73.0, 50.0 ],
                    "text": "test1.jpg, test2.png, test3.svg"
                }
            },
            {
                "box": {
                    "bubble": 1,
                    "bubbleside": 3,
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-25",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 287.9518072289157, 213.0, 55.0 ],
                    "text": "Asset Alias must match the name of an asset uploaded through the performer portal",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "bubble": 1,
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-23",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 548.0722891566265, 690.3614457831326, 213.0, 40.0 ],
                    "text": "Outputs event as JSON that's sent to the Connection patch",
                    "textjustification": 1
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
                    "patching_rect": [ 691.0361445783133, 604.8192771084338, 175.0, 25.0 ],
                    "text": "Manually send message",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "bubble": 1,
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-21",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 691.0361445783133, 573.4939759036145, 213.0, 25.0 ],
                    "text": "Preview or manually set fields",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "bubble": 1,
                    "bubbleside": 2,
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-20",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 409.5180722891567, 328.9156626506024, 104.0, 70.0 ],
                    "text": "Set Asset Alias (and add it to the dropdown)",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "bubble": 1,
                    "bubbleside": 2,
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-34",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 114.33734939759036, 359.03614457831327, 112.5, 40.0 ],
                    "text": "Send message",
                    "textjustification": 1
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
                    "patching_rect": [ 887.8313253012049, 345.7831325301205, 111.0, 55.0 ],
                    "text": "Exec Timestamp (MS)",
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
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 798.6746987951807, 345.7831325301205, 73.0, 55.0 ],
                    "text": "Transition Time (MS)",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "bubble": 1,
                    "bubbleside": 2,
                    "fontname": "Arial",
                    "fontsize": 13.0,
                    "id": "obj-17",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 530.0, 344.5783132530121, 67.0, 55.0 ],
                    "text": "Duration (MS)",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "id": "obj-24",
                    "linecount": 13,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 75.0, 568.0, 200.0 ],
                    "text": "Generates a video event to be sent to the DAVHI Connection patch. The event payload can be set manually in the patch UI, or provided through the inlets. The event is sent out (as JSON) when a signal is sent to the Activation inlet, or the Send button is pressed.\n\nInputs:\nActivation: send the video event\nAsset List: comma seperated list of available assets\nAsset Alias: name of the video file that has been uploaded to the server through the performer portal.\nDuration: how long the video event will last, (positive int, milliseconds), 0 = until end of video or changed\nStart Offset: how long into the video it should start playing (positive int, milliseconds)\nLoop: if the video should loop after it finishes. If duration is 0, loop once\nTransition Time: how long to fade between the current video and this one (positive int, milliseconds)\nTimestamp: when to execute the event relative to the Start event (positive int, milliseconds), 0 = ASAP\n"
                }
            },
            {
                "box": {
                    "fontsize": 32.0,
                    "id": "obj-22",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 30.0, 345.0, 43.0 ],
                    "text": "Video"
                }
            },
            {
                "box": {
                    "id": "obj-16",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 919.156626506024, 400.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-14",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 810.722891566265, 400.0, 50.0, 22.0 ]
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
                    "patching_rect": [ 538.433734939759, 400.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 423.9759036144579, 400.0, 73.0, 22.0 ],
                    "text": "example.jpg"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 158.9156626506024, 398.7951807228916, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "linecount": 12,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 301.08433734939763, 690.3614457831326, 244.0, 174.0 ],
                    "text": "\"{\r\n    \\\"payload\\\": {\r\n        \\\"assetAlias\\\": \\\"example.jpg\\\",\r\n        \\\"startOffsetMs\\\": 0,\r\n        \\\"durationMs\\\": 0,\r\n        \\\"loop\\\": 0,\r\n        \\\"transitionMs\\\": 0\r\n    },\r\n    \\\"schemaVersion\\\": \\\"1.0\\\",\r\n    \\\"type\\\": \\\"video\\\",\r\n    \\\"relativeTimestamp\\\": 0\r\n}\""
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-5",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "video.maxpat",
                    "numinlets": 8,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "" ],
                    "patching_rect": [ 301.08433734939763, 473.49397590361446, 387.9518072289157, 171.0843373493976 ],
                    "viewvisibility": 1
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-5", 2 ],
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 3 ],
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 4 ],
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 6 ],
                    "source": [ "obj-14", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 7 ],
                    "source": [ "obj-16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 5 ],
                    "source": [ "obj-26", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 1 ],
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 1 ],
                    "order": 0,
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "order": 1,
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "source": [ "obj-7", 0 ]
                }
            }
        ],
        "autosave": 0,
        "oscreceiveudpport": 0
    }
}
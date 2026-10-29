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
        "rect": [ -1627.0, 163.0, 1080.0, 820.0 ],
        "boxes": [
            {
                "box": {
                    "fontsize": 24.0,
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 15.0, 1100.0, 34.0 ],
                    "text": "Caption: Send-controlled text and JSON output"
                }
            },
            {
                "box": {
                    "id": "help-text",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 60.0, 1100.0, 34.0 ],
                    "text": "Lock the patch and edit the text and timing values. Click Send to preview one caption event. The visible gate repeats the Send-only editor wiring inside caption.maxpat; this example does not connect to a server."
                }
            },
            {
                "box": {
                    "id": "caption-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 260.0, 355.0, 300.0, 20.0 ],
                    "text": "3. Read the current caption text"
                }
            },
            {
                "box": {
                    "id": "caption-text",
                    "maxclass": "textedit",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "int", "", "" ],
                    "outputmode": 1,
                    "parameter_enable": 0,
                    "patching_rect": [ 260.0, 385.0, 300.0, 55.0 ],
                    "text": "\"Follow the lights\""
                }
            },
            {
                "box": {
                    "id": "duration-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 290.0, 245.0, 180.0, 20.0 ],
                    "text": "2. Duration (ms)"
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
                    "patching_rect": [ 290.0, 290.0, 110.0, 22.0 ]
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
                    "patching_rect": [ 40.0, 125.0, 160.0, 32.0 ],
                    "text": "Send",
                    "texton": "Send"
                }
            },
            {
                "box": {
                    "id": "caption-event",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 40.0, 620.0, 520.0, 22.0 ],
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
                    "patching_rect": [ 40.0, 205.0, 520.0, 22.0 ],
                    "text": "t b b b"
                }
            },
            {
                "box": {
                    "id": "exec-timestamp-label",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 540.0, 245.0, 180.0, 34.0 ],
                    "text": "1. Execution time\n(Unix epoch ms)"
                }
            },
            {
                "box": {
                    "id": "exec-timestamp",
                    "maxclass": "number",
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 540.0, 290.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "duration-default",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 410.0, 245.0, 110.0, 22.0 ],
                    "text": "loadmess 3000"
                }
            },
            {
                "box": {
                    "id": "timestamp-default",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 590.0, 340.0, 90.0, 22.0 ],
                    "text": "loadmess 0"
                }
            },
            {
                "box": {
                    "id": "route-text",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 260.0, 470.0, 80.0, 22.0 ],
                    "text": "route text"
                }
            },
            {
                "box": {
                    "id": "order-note",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 240.0, 125.0, 450.0, 48.0 ],
                    "text": "t b b b runs RIGHT TO LEFT:\n1. Store execution time   2. Store duration\n3. Run the open / read / close sequence."
                }
            },
            {
                "box": {
                    "id": "route-note",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 355.0, 470.0, 224.0, 34.0 ],
                    "text": "Strip the text selector emitted by textedit."
                }
            },
            {
                "box": {
                    "id": "inlets-note",
                    "linecount": 9,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 760.0, 465.0, 218.0, 131.0 ],
                    "presentation_linecount": 9,
                    "text": "CAPTION ABSTRACTION INLETS\n1. Text immediately builds an event.\n2. Duration stores the display duration.\n3. Execution time stores the timestamp.\n\nReceiving caption text triggers JSON output. The editor sends text to this inlet only when you click Send."
                }
            },
            {
                "box": {
                    "id": "output-note",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 170.0, 670.0, 316.0, 34.0 ],
                    "text": "Serialized JSON goes directly to the preview and console."
                }
            },
            {
                "box": {
                    "id": "set-preview",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 40.0, 690.0, 90.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "print",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 540.0, 735.0, 135.0, 22.0 ],
                    "text": "print caption-help"
                }
            },
            {
                "box": {
                    "id": "preview",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 40.0, 755.0, 470.0, 22.0 ],
                    "text": "Click Send caption to view the emitted JSON here."
                }
            },
            {
                "box": {
                    "id": "connection-note",
                    "linecount": 4,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 30.0, 865.0, 874.0, 62.0 ],
                    "text": "TO SEND TO A DEVICE\nConnect caption's outlet directly to connection's first inlet. Connection completes the event with identity and sent time; execution time 0 uses its universal delay. Open caption-to-connection.maxpat for the complete UI and connection example, and see README.md for setup. This help patch only builds and previews events."
                }
            },
            {
                "box": {
                    "id": "read-caption",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "bang", "int" ],
                    "patching_rect": [ 40.0, 290.0, 160.0, 22.0 ],
                    "text": "t 0 b 1"
                }
            },
            {
                "box": {
                    "id": "caption-gate",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 40.0, 545.0, 239.0, 22.0 ],
                    "text": "gate 1 0"
                }
            },
            {
                "box": {
                    "id": "gate-label",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 355.0, 535.0, 300.0, 34.0 ],
                    "text": "Left inlet: 1 opens / 0 closes\nRight inlet: caption text to pass or discard"
                }
            },
            {
                "box": {
                    "id": "gate-explanation",
                    "linecount": 10,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 760.0, 125.0, 218.0, 144.0 ],
                    "text": "HOW SEND WORKS\nAfter the timing values are stored, t 0 b 1 runs right to left:\n\n1 -> open the gate\nb -> ask textedit for the current text\n0 -> close the gate\n\nThe text passes through before the final 0 closes the gate."
                }
            },
            {
                "box": {
                    "id": "idle-explanation",
                    "linecount": 5,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 760.0, 330.0, 224.0, 75.0 ],
                    "text": "BETWEEN CLICKS\ngate 1 0 starts closed. Any editor output outside the Send sequence is discarded.  Click Send again to emit the current text."
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "print", 0 ],
                    "midpoints": [ 49.5, 655.0, 685.0, 655.0, 685.0, 725.0, 549.5, 725.0 ],
                    "order": 0,
                    "source": [ "caption-event", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "set-preview", 0 ],
                    "order": 1,
                    "source": [ "caption-event", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "caption-event", 0 ],
                    "source": [ "caption-gate", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "route-text", 0 ],
                    "source": [ "caption-text", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "caption-event", 1 ],
                    "midpoints": [ 299.5, 325.0, 700.0, 325.0, 700.0, 595.0, 300.0, 595.0 ],
                    "source": [ "duration", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "duration", 0 ],
                    "midpoints": [ 419.5, 280.0, 299.5, 280.0 ],
                    "source": [ "duration-default", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "caption-event", 2 ],
                    "midpoints": [ 549.5, 320.0, 725.0, 320.0, 725.0, 605.0, 550.5, 605.0 ],
                    "source": [ "exec-timestamp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "caption-gate", 0 ],
                    "midpoints": [ 190.5, 330.0, 215.0, 330.0, 215.0, 525.0, 49.5, 525.0 ],
                    "source": [ "read-caption", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "caption-gate", 0 ],
                    "source": [ "read-caption", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "caption-text", 0 ],
                    "midpoints": [ 120.0, 345.0, 269.5, 345.0 ],
                    "source": [ "read-caption", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "caption-gate", 1 ],
                    "source": [ "route-text", 0 ]
                }
            },
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
                    "destination": [ "exec-timestamp", 0 ],
                    "source": [ "send-order", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "read-caption", 0 ],
                    "source": [ "send-order", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "preview", 0 ],
                    "source": [ "set-preview", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "exec-timestamp", 0 ],
                    "midpoints": [ 599.5, 375.0, 710.0, 375.0, 710.0, 280.0, 549.5, 280.0 ],
                    "source": [ "timestamp-default", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}
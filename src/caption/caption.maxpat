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
        "rect": [ 144.0, 197.0, 1221.0, 710.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "id": "ui-caption-empty-route",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 691.0, 340.0, 75.0, 22.0 ],
                    "text": "route bang"
                }
            },
            {
                "box": {
                    "id": "empty-caption-duration",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1000.0, 390.0, 180.0, 22.0 ],
                    "text": "prepend replace durationMs"
                }
            },
            {
                "box": {
                    "data": {
                        "text": "",
                        "durationMs": 0
                    },
                    "id": "empty-caption-payload",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "dictionary", "", "", "", "" ],
                    "patching_rect": [ 691.0, 430.0, 100.0, 22.0 ],
                    "saved_object_attributes": {
                        "embed": 1,
                        "legacy": 0,
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "dict @embed 1"
                }
            },
            {
                "box": {
                    "comment": "Caption text; sends an event using the stored duration and execution time",
                    "id": "payload-in",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 35.0, 90.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "payload-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 35.0, 45.0, 160.0, 20.0 ],
                    "text": "text "
                }
            },
            {
                "box": {
                    "id": "caption-event",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 1,
                    "outlettype": [ "dictionary" ],
                    "patching_rect": [ 35.0, 364.0, 620.0, 22.0 ],
                    "text": "dict.pack schemaVersion: type: caption execTimestamp: payload: @triggers 3 @unmatched 0"
                }
            },
            {
                "box": {
                    "id": "serialize-event",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 35.0, 406.0, 145.0, 22.0 ],
                    "text": "dict.serialize @mode json"
                }
            },
            {
                "box": {
                    "comment": "Caption JSON for connection.maxpat to complete and send",
                    "id": "event-out",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 35.0, 485.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "output-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 80.0, 561.0, 390.0, 20.0 ],
                    "text": "Connect to connection to add identity and sent time, then send."
                }
            },
            {
                "box": {
                    "comment": "Execution time in Unix epoch milliseconds; set before text",
                    "id": "exec-timestamp-in",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 435.0, 90.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "exec-timestamp-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 435.0, 45.0, 150.0, 20.0 ],
                    "text": "execTimestamp"
                }
            },
            {
                "box": {
                    "comment": "Duration in milliseconds; set before text",
                    "id": "duration-in",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 235.0, 90.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "duration-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 235.0, 45.0, 170.0, 20.0 ],
                    "text": "durationMs"
                }
            },
            {
                "box": {
                    "id": "text-symbol",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 35.0, 166.0, 60.0, 22.0 ],
                    "text": "tosymbol"
                }
            },
            {
                "box": {
                    "id": "payload-pack",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "dictionary" ],
                    "patching_rect": [ 35.0, 320.0, 220.0, 22.0 ],
                    "text": "dict.pack text: durationMs:"
                }
            },
            {
                "box": {
                    "fontsize": 20.0,
                    "id": "ui-title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 691.0, 19.0, 250.0, 29.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 15.0, 250.0, 29.0 ],
                    "text": "Caption event"
                }
            },
            {
                "box": {
                    "id": "ui-caption-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 691.0, 60.0, 120.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 56.0, 120.0, 20.0 ],
                    "text": "Caption text"
                }
            },
            {
                "box": {
                    "id": "ui-caption-text",
                    "maxclass": "textedit",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "int", "", "" ],
                    "outputmode": 1,
                    "parameter_enable": 0,
                    "patching_rect": [ 691.0, 84.0, 360.0, 32.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 80.0, 360.0, 32.0 ]
                }
            },
            {
                "box": {
                    "id": "ui-caption-route",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 691.0, 260.0, 65.0, 22.0 ],
                    "text": "route text"
                }
            },
            {
                "box": {
                    "id": "ui-caption-gate",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 691.0, 300.0, 65.0, 22.0 ],
                    "text": "gate 1 0"
                }
            },
            {
                "box": {
                    "id": "ui-read-caption",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "bang", "int" ],
                    "patching_rect": [ 800.0, 300.0, 65.0, 22.0 ],
                    "text": "t 0 b 1"
                }
            },
            {
                "box": {
                    "id": "ui-caption-set",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 160.0, 239.0, 85.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "ui-duration-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1076.0, 60.0, 145.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 405.0, 56.0, 145.0, 20.0 ],
                    "text": "Duration (ms)"
                }
            },
            {
                "box": {
                    "id": "ui-duration",
                    "maxclass": "number",
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1076.0, 84.0, 85.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 405.0, 80.0, 85.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "ui-send-button",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 691.0, 189.0, 150.0, 36.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 185.0, 150.0, 36.0 ],
                    "text": "Send"
                }
            },
            {
                "box": {
                    "id": "ui-send-order",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "bang", "bang", "bang" ],
                    "patching_rect": [ 926.0, 350.0, 65.0, 22.0 ],
                    "text": "t b b b"
                }
            },
            {
                "box": {
                    "id": "ui-exec-timestamp-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 691.0, 124.0, 280.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 120.0, 280.0, 20.0 ],
                    "text": "Execution time (Unix epoch ms)"
                }
            },
            {
                "box": {
                    "id": "ui-exec-timestamp",
                    "maxclass": "number",
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 691.0, 150.0, 200.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 144.0, 200.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "sync-text",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 35.0, 239.0, 45.0, 22.0 ],
                    "text": "t s s"
                }
            },
            {
                "box": {
                    "id": "event-print",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 80.0, 449.0, 100.0, 22.0 ],
                    "text": "print caption"
                }
            },
            {
                "box": {
                    "id": "schema-version-load",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 435.6666666666667, 285.0, 130.0, 22.0 ],
                    "text": "loadmess 49 46 48"
                }
            },
            {
                "box": {
                    "id": "schema-version-string",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 435.6666666666667, 320.0, 50.0, 22.0 ],
                    "text": "itoa"
                }
            },
            {
                "box": {
                    "background": 1,
                    "bgcolor": [ 0.08, 0.08, 0.08, 1.0 ],
                    "id": "ui-background",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 675.0, 3.0, 590.0, 240.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.0, 0.0, 570.0, 239.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "serialize-event", 0 ],
                    "source": [ "caption-event", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-duration", 0 ],
                    "source": [ "duration-in", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "empty-caption-payload", 0 ],
                    "source": [ "empty-caption-duration", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "caption-event", 3 ],
                    "source": [ "empty-caption-payload", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-exec-timestamp", 0 ],
                    "source": [ "exec-timestamp-in", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "text-symbol", 0 ],
                    "source": [ "payload-in", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "caption-event", 3 ],
                    "source": [ "payload-pack", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "schema-version-string", 0 ],
                    "source": [ "schema-version-load", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "caption-event", 0 ],
                    "source": [ "schema-version-string", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "event-out", 0 ],
                    "order": 1,
                    "source": [ "serialize-event", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "event-print", 0 ],
                    "order": 0,
                    "source": [ "serialize-event", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "payload-pack", 0 ],
                    "source": [ "sync-text", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-caption-set", 0 ],
                    "source": [ "sync-text", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sync-text", 0 ],
                    "source": [ "text-symbol", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "empty-caption-payload", 0 ],
                    "source": [ "ui-caption-empty-route", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "text-symbol", 0 ],
                    "source": [ "ui-caption-empty-route", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-caption-empty-route", 0 ],
                    "source": [ "ui-caption-gate", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-caption-gate", 1 ],
                    "source": [ "ui-caption-route", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-caption-text", 0 ],
                    "source": [ "ui-caption-set", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-caption-route", 0 ],
                    "source": [ "ui-caption-text", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "empty-caption-duration", 0 ],
                    "order": 0,
                    "source": [ "ui-duration", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "payload-pack", 1 ],
                    "order": 1,
                    "source": [ "ui-duration", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "caption-event", 2 ],
                    "source": [ "ui-exec-timestamp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-caption-gate", 0 ],
                    "source": [ "ui-read-caption", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-caption-gate", 0 ],
                    "source": [ "ui-read-caption", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-caption-text", 0 ],
                    "source": [ "ui-read-caption", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-send-order", 0 ],
                    "source": [ "ui-send-button", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-duration", 0 ],
                    "source": [ "ui-send-order", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-exec-timestamp", 0 ],
                    "source": [ "ui-send-order", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ui-read-caption", 0 ],
                    "source": [ "ui-send-order", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}
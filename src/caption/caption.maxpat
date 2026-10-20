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
        "rect": [ 120.0, 120.0, 760.0, 440.0 ],
        "boxes": [
            {
                "box": {
                    "id": "store-then-output",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "symbol" ],
                    "patching_rect": [ 35.0, 250.0, 45.0, 22.0 ],
                    "text": "t b s"
                }
            },
            {
                "box": {
                    "id": "event-message",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 35.0, 290.0, 650.0, 40.0 ],
                    "text": ""
                }
            },
            {
                "box": {
                    "comment": "Caption payload dictionary: text and optional durationMs",
                    "id": "payload-in",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "dictionary" ],
                    "patching_rect": [ 35.0, 90.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "payload-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 35.0, 45.0, 105.0, 20.0 ],
                    "text": "payload (dictionary)"
                }
            },
            {
                "box": {
                    "id": "caption-event",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "dictionary" ],
                    "patching_rect": [ 35.0, 165.0, 460.0, 22.0 ],
                    "text": "dict.pack payload: execTimestamp: type: caption schemaVersion: \"1.0\""
                }
            },
            {
                "box": {
                    "id": "serialize-event",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 35.0, 210.0, 145.0, 22.0 ],
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
                    "patching_rect": [ 35.0, 360.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "output-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 80.0, 365.0, 390.0, 20.0 ],
                    "text": "Connect to connection to add identity and sent time, then send."
                }
            },
            {
                "box": {
                    "id": "exec-timestamp-in",
                    "index": 1,
                    "maxclass": "inlet",
                    "comment": "Execution time in Unix epoch milliseconds; set before payload",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 235.0, 90.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "exec-timestamp-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 235.0, 45.0, 150.0, 20.0 ],
                    "text": "execTimestamp"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "caption-event", 0 ],
                    "source": [ "payload-in", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "serialize-event", 0 ],
                    "source": [ "caption-event", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "store-then-output", 0 ],
                    "source": [ "serialize-event", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "store-then-output", 1 ],
                    "destination": [ "event-message", 1 ]
                }
            },
            {
                "patchline": {
                    "source": [ "store-then-output", 0 ],
                    "destination": [ "event-message", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "event-message", 0 ],
                    "destination": [ "event-out", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "exec-timestamp-in", 0 ],
                    "destination": [ "caption-event", 1 ]
                }
            }
        ],
        "autosave": 0
    }
}

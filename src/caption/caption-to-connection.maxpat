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
        "rect": [100.0, 100.0, 650.0, 650.0],
        "openinpresentation": 0,
        "boxes": [
            {
                "box": {
                    "id": "title",
                    "maxclass": "comment",
                    "fontsize": 20.0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [20.0, 15.0, 590.0, 28.0],
                    "presentation": 1,
                    "presentation_rect": [20.0, 15.0, 590.0, 28.0],
                    "text": "Caption UI to connection"
                }
            },
            {
                "box": {
                    "id": "instructions",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "linecount": 3,
                    "patching_rect": [20.0, 50.0, 590.0, 52.0],
                    "presentation": 1,
                    "presentation_rect": [20.0, 50.0, 590.0, 52.0],
                    "text": "Configure src/connection/.env and install dependencies if needed. Click Start Connection and wait for connected, then click Send caption. Sent events, acknowledgements, and errors appear in the Max Console."
                }
            },
            {
                "box": {
                    "id": "caption-ui",
                    "maxclass": "bpatcher",
                    "name": "caption.maxpat",
                    "border": 1,
                    "bgmode": 2,
                    "bgcolor": [0.15, 0.15, 0.15, 1.0],
                    "hidden": 0,
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [""],
                    "patching_rect": [20.0, 115.0, 590.0, 240.0],
                    "presentation": 1,
                    "presentation_rect": [20.0, 115.0, 590.0, 240.0],
                    "offset": [0.0, 0.0],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "caption-connection-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [45.0, 358.0, 440.0, 20.0],
                    "text": "Caption JSON outlet -> connection event inlet -> server"
                }
            },
            {
                "box": {
                    "id": "connection",
                    "maxclass": "bpatcher",
                    "name": "connection.maxpat",
                    "border": 1,
                    "bgmode": 2,
                    "bgcolor": [0.15, 0.15, 0.15, 1.0],
                    "hidden": 0,
                    "numinlets": 5,
                    "numoutlets": 1,
                    "outlettype": [""],
                    "patching_rect": [20.0, 385.0, 443.0, 174.0],
                    "presentation": 1,
                    "presentation_rect": [20.0, 385.0, 443.0, 174.0],
                    "offset": [0.0, 0.0],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "connection-print",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [85.0, 590.0, 180.0, 22.0],
                    "text": "print caption-ui-to-connection"
                }
            },
            {
                "box": {
                    "id": "connection-out",
                    "maxclass": "outlet",
                    "comment": "Connection status, sent events, acknowledgements, inbound messages, and errors",
                    "index": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [20.0, 590.0, 30.0, 30.0]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "source": ["caption-ui", 0],
                    "destination": ["connection", 0],
                    "hidden": 0
                }
            },
            {
                "patchline": {
                    "source": ["connection", 0],
                    "destination": ["connection-print", 0],
                    "order": 0
                }
            },
            {
                "patchline": {
                    "source": ["connection", 0],
                    "destination": ["connection-out", 0],
                    "order": 1
                }
            }
        ],
        "dependency_cache": [
            {
                "name": "caption.maxpat",
                "patcherrelativepath": ".",
                "type": "JSON",
                "implicit": 1
            },
            {
                "name": "connection.maxpat",
                "patcherrelativepath": "../connection",
                "type": "JSON",
                "implicit": 1
            }
        ],
        "autosave": 0
    }
}

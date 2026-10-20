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
        "rect": [ 100.0, 100.0, 1000.0, 660.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "fontsize": 22.0,
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 15.0, 500.0, 32.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 15.0, 500.0, 32.0 ],
                    "text": "Torch UI -> Server"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "torch-ui",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "torch.maxpat",
                    "numinlets": 5,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 60.0, 480.0, 500.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 60.0, 480.0, 500.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "connection",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "connection.maxpat",
                    "numinlets": 5,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "" ],
                    "patching_rect": [ 530.0, 60.0, 443.0, 174.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 530.0, 60.0, 443.0, 174.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "instructions",
                    "linecount": 12,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 530.0, 255.0, 310.0, 172.0 ],
                    "presentation": 1,
                    "presentation_linecount": 9,
                    "presentation_rect": [ 530.0, 255.0, 496.0, 131.0 ],
                    "text": "1. Start the local server and configure connection/.env.\n2. Install Dependencies if needed; reopen this patch afterward.\n3. Start Connection and wait for connected.\n4. Enter duration, transition, intensity, and timestamp 0.\n5. Press SEND; inspect torch-server in the Max Console.\n\nUse timestamp 0 to apply Universal delay.\n\nSee README.md for setup and troubleshooting."
                }
            },
            {
                "box": {
                    "id": "print",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 530.0, 580.0, 140.0, 22.0 ],
                    "text": "print torch-server"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "print", 0 ],
                    "source": [ "connection", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "connection", 0 ],
                    "source": [ "torch-ui", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}

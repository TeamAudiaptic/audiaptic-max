{
  "patcher": {
    "fileversion": 1,
    "appversion": { "major": 9, "minor": 1, "revision": 5, "architecture": "x64", "modernui": 1 },
    "classnamespace": "box",
    "rect": [100, 100, 1000, 660],
    "openinpresentation": 1,
    "boxes": [
      { "box": { "id": "title", "maxclass": "comment", "text": "Torch UI -> Server", "fontsize": 22, "numinlets": 1, "numoutlets": 0, "patching_rect": [20, 15, 500, 30], "presentation": 1, "presentation_rect": [20, 15, 500, 30] } },
      { "box": { "id": "torch-ui", "maxclass": "bpatcher", "name": "torch-ui.maxpat", "numinlets": 0, "numoutlets": 1, "outlettype": ["dictionary"], "patching_rect": [20, 60, 480, 500], "presentation": 1, "presentation_rect": [20, 60, 480, 500], "offset": [0, 0], "border": 0, "bgmode": 0, "clickthrough": 0, "enablehscroll": 0, "enablevscroll": 0, "viewvisibility": 1 } },
      { "box": { "id": "serialize", "maxclass": "newobj", "text": "dict.serialize @mode json", "numinlets": 1, "numoutlets": 1, "outlettype": [""], "patching_rect": [20, 580, 180, 22] } },
      { "box": { "id": "connection", "maxclass": "bpatcher", "name": "Patcher:/../connection/connection.maxpat", "numinlets": 5, "numoutlets": 1, "outlettype": [""], "patching_rect": [530, 60, 443, 174], "presentation": 1, "presentation_rect": [530, 60, 443, 174], "offset": [0, 0], "border": 0, "bgmode": 0, "clickthrough": 0, "enablehscroll": 0, "enablevscroll": 0, "viewvisibility": 1 } },
      { "box": { "id": "instructions", "maxclass": "comment", "text": "1. Start the local server and configure connection/.env.\n2. Install Dependencies if needed; reopen this patch afterward.\n3. Start Connection and wait for connected.\n4. Enter duration, transition, intensity, and timestamp 0.\n5. Press SEND; inspect torch-server in the Max Console.\n\nUse timestamp 0 to apply Universal delay. The existing null button may serialize null as text.\n\nSee README.md for setup and troubleshooting.", "numinlets": 1, "numoutlets": 0, "linecount": 12, "patching_rect": [530, 255, 440, 200], "presentation": 1, "presentation_rect": [530, 255, 440, 200] } },
      { "box": { "id": "print", "maxclass": "newobj", "text": "print torch-server", "numinlets": 1, "numoutlets": 0, "patching_rect": [530, 580, 140, 22] } }
    ],
    "lines": [
      { "patchline": { "source": ["torch-ui", 0], "destination": ["serialize", 0] } },
      { "patchline": { "source": ["serialize", 0], "destination": ["connection", 0] } },
      { "patchline": { "source": ["connection", 0], "destination": ["print", 0] } }
    ],
    "autosave": 0
  }
}

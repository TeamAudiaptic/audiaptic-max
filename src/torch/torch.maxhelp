{
  "patcher": {
    "fileversion": 1,
    "appversion": { "major": 9, "minor": 1, "revision": 5, "architecture": "x64", "modernui": 1 },
    "classnamespace": "box",
    "rect": [100, 100, 1000, 760],
    "openinpresentation": 0,
    "boxes": [
      { "box": { "id": "title", "maxclass": "comment", "text": "torch — build a torch event", "fontsize": 24, "numinlets": 1, "numoutlets": 0, "patching_rect": [25, 20, 650, 35] } },
      { "box": { "id": "intro", "maxclass": "comment", "text": "Set the values, then click SEND. The outlet produces a Max dictionary; this example previews it locally and does not open a server connection.", "linecount": 2, "numinlets": 1, "numoutlets": 0, "patching_rect": [25, 65, 930, 40] } },
      { "box": { "id": "duration-label", "maxclass": "comment", "text": "1. Duration (ms)", "numinlets": 1, "numoutlets": 0, "patching_rect": [25, 130, 150, 20] } },
      { "box": { "id": "timestamp-label", "maxclass": "comment", "text": "2. Execution time (Unix ms)", "numinlets": 1, "numoutlets": 0, "patching_rect": [210, 130, 200, 20] } },
      { "box": { "id": "intensity-label", "maxclass": "comment", "text": "3. Intensity (integer)", "numinlets": 1, "numoutlets": 0, "patching_rect": [420, 130, 160, 20] } },
      { "box": { "id": "transition-label", "maxclass": "comment", "text": "4. Transition (ms)", "numinlets": 1, "numoutlets": 0, "patching_rect": [610, 130, 160, 20] } },
      { "box": { "id": "send-label", "maxclass": "comment", "text": "5. SEND (bang)", "numinlets": 1, "numoutlets": 0, "patching_rect": [810, 130, 150, 20] } },
      { "box": { "id": "duration-default", "maxclass": "newobj", "text": "loadmess 250", "numinlets": 1, "numoutlets": 1, "outlettype": [""], "patching_rect": [25, 105, 95, 22] } },
      { "box": { "id": "timestamp-default", "maxclass": "newobj", "text": "loadmess 0", "numinlets": 1, "numoutlets": 1, "outlettype": [""], "patching_rect": [210, 105, 85, 22] } },
      { "box": { "id": "duration", "maxclass": "number", "minimum": 0, "numinlets": 1, "numoutlets": 2, "outlettype": ["", "bang"], "parameter_enable": 0, "patching_rect": [25, 165, 110, 22] } },
      { "box": { "id": "timestamp", "maxclass": "number", "minimum": 0, "numinlets": 1, "numoutlets": 2, "outlettype": ["", "bang"], "parameter_enable": 0, "patching_rect": [210, 165, 175, 22] } },
      { "box": { "id": "intensity", "maxclass": "number", "minimum": 0, "numinlets": 1, "numoutlets": 2, "outlettype": ["", "bang"], "parameter_enable": 0, "patching_rect": [420, 165, 110, 22] } },
      { "box": { "id": "transition", "maxclass": "number", "minimum": 0, "numinlets": 1, "numoutlets": 2, "outlettype": ["", "bang"], "parameter_enable": 0, "patching_rect": [610, 165, 110, 22] } },
      { "box": { "id": "send", "maxclass": "button", "numinlets": 1, "numoutlets": 1, "outlettype": ["bang"], "parameter_enable": 0, "patching_rect": [810, 160, 35, 35] } },
      { "box": { "id": "torch", "maxclass": "newobj", "text": "torch", "numinlets": 5, "numoutlets": 1, "outlettype": ["dictionary"], "patching_rect": [25, 255, 825, 22] } },
      { "box": { "id": "serialize", "maxclass": "newobj", "text": "dict.serialize @mode json", "numinlets": 1, "numoutlets": 1, "outlettype": [""], "patching_rect": [25, 310, 180, 22] } },
      { "box": { "id": "set-display", "maxclass": "newobj", "text": "prepend set", "numinlets": 1, "numoutlets": 1, "outlettype": [""], "patching_rect": [25, 350, 85, 22] } },
      { "box": { "id": "print", "maxclass": "newobj", "text": "print torch-help", "numinlets": 1, "numoutlets": 0, "patching_rect": [240, 350, 120, 22] } },
      { "box": { "id": "display", "maxclass": "message", "text": "Click SEND to preview the event JSON.", "numinlets": 2, "numoutlets": 1, "outlettype": [""], "patching_rect": [25, 395, 550, 240] } },
      { "box": { "id": "notes", "maxclass": "comment", "text": "Defaults: duration 250 ms, intensity 0, transition 0. This example initializes execution time to 0.\n\nAll four number boxes have minimum 0. Negative integer inputs to torch are also clamped to 0 by torch.js. Editing a value does not emit an event; bang inlet 5 to emit.\n\nExecution time 0 tells the connection patch to use the current time plus its universal delay. The abstraction also accepts the symbol null, but its dictionary can serialize that as a string; use 0 for server tests.", "linecount": 16, "numinlets": 1, "numoutlets": 0, "patching_rect": [610, 310, 350, 280] } },
      { "box": { "id": "server-notes", "maxclass": "comment", "text": "To send to the server: connect dict.serialize's output to connection's first inlet. The connection adds event identity and timing fields. Open torch-ui-connection-test.maxpat for the complete UI and connection example; see README.md for setup. A sent message confirms a socket write; ack is a server response, not device execution confirmation.", "linecount": 4, "numinlets": 1, "numoutlets": 0, "patching_rect": [25, 665, 930, 65] } }
    ],
    "lines": [
      { "patchline": { "source": ["duration-default", 0], "destination": ["duration", 0] } },
      { "patchline": { "source": ["timestamp-default", 0], "destination": ["timestamp", 0] } },
      { "patchline": { "source": ["duration", 0], "destination": ["torch", 0] } },
      { "patchline": { "source": ["timestamp", 0], "destination": ["torch", 1] } },
      { "patchline": { "source": ["intensity", 0], "destination": ["torch", 2] } },
      { "patchline": { "source": ["transition", 0], "destination": ["torch", 3] } },
      { "patchline": { "source": ["send", 0], "destination": ["torch", 4] } },
      { "patchline": { "source": ["torch", 0], "destination": ["serialize", 0] } },
      { "patchline": { "source": ["serialize", 0], "destination": ["set-display", 0], "order": 0 } },
      { "patchline": { "source": ["serialize", 0], "destination": ["print", 0], "order": 1 } },
      { "patchline": { "source": ["set-display", 0], "destination": ["display", 0] } }
    ],
    "autosave": 0
  }
}

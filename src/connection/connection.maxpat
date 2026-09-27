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
        "rect": [ 134.0, 134.0, 998.0, 778.0 ],
        "boxes": [
            {
                "box": {
                    "fontsize": 18.0,
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 40.0, 35.0, 220.0, 27.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 15.0, 240.0, 27.0 ],
                    "text": "DAVHI Connection",
                    "textcolor": [ 0.95, 0.95, 0.95, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "event-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 600.0, 35.0, 80.0, 20.0 ],
                    "text": "Events"
                }
            },
            {
                "box": {
                    "comment": "Complete Audiaptic event JSON",
                    "id": "event-inlet",
                    "index": 1,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 600.0, 65.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 600.0, 110.0, 82.0, 22.0 ],
                    "text": "prepend send"
                }
            },
            {
                "box": {
                    "id": "delay-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 40.0, 80.0, 145.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 60.0, 145.0, 20.0 ],
                    "text": "Universal delay (ms)",
                    "textcolor": [ 0.8, 0.8, 0.8, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.12, 0.12, 0.12, 1.0 ],
                    "id": "delay",
                    "maxclass": "number",
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 40.0, 109.0, 125.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 85.0, 125.0, 22.0 ],
                    "textcolor": [ 0.95, 0.95, 0.95, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "set-delay",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 600.0, 145.0, 104.0, 22.0 ],
                    "text": "prepend setDelay"
                }
            },
            {
                "box": {
                    "id": "start-control",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 309.0, 33.5, 125.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 165.0, 80.0, 120.0, 30.0 ],
                    "text": "Start Connection"
                }
            },
            {
                "box": {
                    "id": "stop-control",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 335.0, 105.0, 125.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 295.0, 80.0, 120.0, 30.0 ],
                    "text": "Stop Connection"
                }
            },
            {
                "box": {
                    "id": "setup-control",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 175.0, 107.5, 150.0, 25.0 ],
                    "text": "Install Dependencies"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "install",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 600.0, 220.0, 105.0, 22.0 ],
                    "text": "script npm install"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "start-connection",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 715.0, 220.0, 55.0, 22.0 ],
                    "text": "connect"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "stop-connection",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 780.0, 220.0, 67.0, 22.0 ],
                    "text": "disconnect"
                }
            },
            {
                "box": {
                    "id": "status-label",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 40.0, 150.0, 55.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 130.0, 55.0, 20.0 ],
                    "text": "Status",
                    "textcolor": [ 0.8, 0.8, 0.8, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.12, 0.12, 0.12, 1.0 ],
                    "bgcolor2": [ 0.172137149796092, 0.172137100044002, 0.172137113045018, 1 ],
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.172137149796092, 0.172137100044002, 0.172137113045018, 1 ],
                    "bgfillcolor_color1": [ 0.12, 0.12, 0.12, 1.0 ],
                    "bgfillcolor_color2": [ 0.172137149796092, 0.172137100044002, 0.172137113045018, 1 ],
                    "bgfillcolor_type": "gradient",
                    "gradient": 1,
                    "id": "status",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 100.0, 150.0, 300.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 75.0, 128.0, 340.0, 22.0 ],
                    "text": "waiting for connection",
                    "textcolor": [ 0.95, 0.95, 0.95, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "route-connection",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 600.0, 270.0, 106.0, 22.0 ],
                    "text": "route connection"
                }
            },
            {
                "box": {
                    "id": "set-status",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 600.0, 305.0, 82.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "node",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 600.0, 350.0, 213.0, 22.0 ],
                    "saved_object_attributes": {
                        "autostart": 1,
                        "defer": 0,
                        "node_bin_path": "",
                        "npm_bin_path": "",
                        "watch": 0
                    },
                    "text": "node.script connection.js @autostart 1",
                    "textfile": {
                        "filename": "connection.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    }
                }
            },
            {
                "box": {
                    "comment": "Connection, acknowledgement, inbound, and error messages",
                    "id": "output",
                    "index": 1,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 600.0, 390.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "debug",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 825.0, 350.0, 75.0, 22.0 ],
                    "text": "node.debug"
                }
            },
            {
                "box": {
                    "background": 1,
                    "bgcolor": [ 0.04, 0.04, 0.04, 1.0 ],
                    "id": "control-panel",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 21.0, 449.0, 189.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.0, 0.0, 430.0, 190.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "set-delay", 0 ],
                    "midpoints": [ 49.5, 131.0, 27.0, 131.0, 27.0, 142.0, 585.0, 142.0, 585.0, 141.0, 609.5, 141.0 ],
                    "source": [ "delay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "send", 0 ],
                    "source": [ "event-inlet", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "midpoints": [ 609.5, 255.0, 573.0, 255.0, 573.0, 345.0, 609.5, 345.0 ],
                    "source": [ "install", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "debug", 0 ],
                    "source": [ "node", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "output", 0 ],
                    "order": 0,
                    "source": [ "node", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "route-connection", 0 ],
                    "midpoints": [ 609.5, 375.0, 583.0, 375.0, 583.0, 267.0, 609.5, 267.0 ],
                    "order": 1,
                    "source": [ "node", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "set-status", 0 ],
                    "source": [ "route-connection", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "midpoints": [ 609.5, 135.0, 554.0, 135.0, 554.0, 345.0, 609.5, 345.0 ],
                    "source": [ "send", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "midpoints": [ 609.5, 207.0, 564.0, 207.0, 564.0, 345.0, 609.5, 345.0 ],
                    "source": [ "set-delay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "status", 0 ],
                    "midpoints": [ 609.5, 330.0, 544.0, 330.0, 544.0, 142.0, 109.5, 142.0 ],
                    "source": [ "set-status", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "install", 0 ],
                    "midpoints": [ 184.5, 140.0, 546.0, 140.0, 546.0, 196.0, 609.5, 196.0 ],
                    "source": [ "setup-control", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "midpoints": [ 724.5, 255.0, 724.0, 255.0, 724.0, 339.0, 609.5, 339.0 ],
                    "source": [ "start-connection", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "start-connection", 0 ],
                    "midpoints": [ 318.5, 83.0, 544.0, 83.0, 544.0, 196.0, 724.5, 196.0 ],
                    "source": [ "start-control", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "node", 0 ],
                    "midpoints": [ 789.5, 255.0, 789.0, 255.0, 789.0, 339.0, 609.5, 339.0 ],
                    "source": [ "stop-connection", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "stop-connection", 0 ],
                    "midpoints": [ 344.5, 143.0, 545.0, 143.0, 545.0, 196.0, 789.5, 196.0 ],
                    "source": [ "stop-control", 0 ]
                }
            }
        ]
    }
}
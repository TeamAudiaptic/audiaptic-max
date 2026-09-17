{
	"patcher" : {
		"fileversion" : 1,
		"appversion" : { "major" : 9, "minor" : 1, "revision" : 5, "architecture" : "x64", "modernui" : 1 },
		"classnamespace" : "box",
		"rect" : [ 0.0, 0.0, 360.0, 158.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
		"boxes" : [
			{
				"box" : {
					"id" : "panel",
					"maxclass" : "panel",
					"mode" : 1,
					"rounded" : 8.0,
					"background" : 1,
					"bgcolor" : [ 0.13, 0.15, 0.18, 1.0 ],
					"patching_rect" : [ 0.0, 0.0, 360.0, 158.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 0.0, 360.0, 158.0 ]
				}
			},
			{
				"box" : {
					"id" : "title",
					"maxclass" : "comment",
					"text" : "Davhi message",
					"fontface" : 1,
					"fontsize" : 14.0,
					"textcolor" : [ 0.94, 0.96, 0.98, 1.0 ],
					"patching_rect" : [ 16.0, 12.0, 180.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 16.0, 12.0, 180.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "type-label",
					"maxclass" : "comment",
					"text" : "Message Type",
					"fontsize" : 11.0,
					"textcolor" : [ 0.72, 0.77, 0.83, 1.0 ],
					"patching_rect" : [ 16.0, 44.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 16.0, 44.0, 100.0, 20.0 ]
				}
			},
			{
				"box" : {
					"id" : "type-input",
					"maxclass" : "textedit",
					"text" : "gesture",
					"rounded" : 4.0,
					"fontsize" : 12.0,
					"patching_rect" : [ 126.0, 42.0, 218.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 126.0, 42.0, 218.0, 24.0 ]
				}
			},
			{
				"box" : {
					"id" : "value-label",
					"maxclass" : "comment",
					"text" : "Value",
					"fontsize" : 11.0,
					"textcolor" : [ 0.72, 0.77, 0.83, 1.0 ],
					"patching_rect" : [ 16.0, 80.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 16.0, 80.0, 100.0, 20.0 ]
				}
			},
			{
				"box" : {
					"id" : "value-input",
					"maxclass" : "textedit",
					"text" : "0.75",
					"rounded" : 4.0,
					"fontsize" : 12.0,
					"patching_rect" : [ 126.0, 78.0, 218.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 126.0, 78.0, 218.0, 24.0 ]
				}
			},
			{
				"box" : {
					"id" : "send-button",
					"maxclass" : "textbutton",
					"text" : "Send",
					"texton" : "Send",
					"fontface" : 1,
					"rounded" : 5.0,
					"bgcolor" : [ 0.18, 0.45, 0.82, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"patching_rect" : [ 244.0, 116.0, 100.0, 28.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 244.0, 116.0, 100.0, 28.0 ]
				}
			},
			{
				"box" : {
					"id" : "encoder",
					"maxclass" : "newobj",
					"text" : "js davhi_message_form.js",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 16.0, 184.0, 154.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "type-prepend",
					"maxclass" : "newobj",
					"text" : "prepend setMessageType",
					"patching_rect" : [ 16.0, 220.0, 150.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "type-route",
					"maxclass" : "newobj",
					"text" : "route text",
					"patching_rect" : [ 16.0, 202.0, 64.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "value-prepend",
					"maxclass" : "newobj",
					"text" : "prepend setValue",
					"patching_rect" : [ 184.0, 220.0, 118.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "value-route",
					"maxclass" : "newobj",
					"text" : "route text",
					"patching_rect" : [ 184.0, 202.0, 64.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "send-trigger",
					"maxclass" : "newobj",
					"text" : "t b b b",
					"patching_rect" : [ 314.0, 184.0, 48.0, 22.0 ]
				}
			},
			{
				"box" : {
					"id" : "output",
					"maxclass" : "outlet",
					"patching_rect" : [ 16.0, 262.0, 30.0, 30.0 ],
					"comment" : "send <valid JSON>"
				}
			}
		],
		"lines" : [
			{ "patchline" : { "source" : [ "type-input", 0 ], "destination" : [ "type-route", 0 ] } },
			{ "patchline" : { "source" : [ "type-route", 0 ], "destination" : [ "type-prepend", 0 ] } },
			{ "patchline" : { "source" : [ "type-prepend", 0 ], "destination" : [ "encoder", 0 ] } },
			{ "patchline" : { "source" : [ "value-input", 0 ], "destination" : [ "value-route", 0 ] } },
			{ "patchline" : { "source" : [ "value-route", 0 ], "destination" : [ "value-prepend", 0 ] } },
			{ "patchline" : { "source" : [ "value-prepend", 0 ], "destination" : [ "encoder", 0 ] } },
			{ "patchline" : { "source" : [ "send-button", 0 ], "destination" : [ "send-trigger", 0 ] } },
			{ "patchline" : { "source" : [ "send-trigger", 2 ], "destination" : [ "type-input", 0 ] } },
			{ "patchline" : { "source" : [ "send-trigger", 1 ], "destination" : [ "value-input", 0 ] } },
			{ "patchline" : { "source" : [ "send-trigger", 0 ], "destination" : [ "encoder", 0 ] } },
			{ "patchline" : { "source" : [ "encoder", 0 ], "destination" : [ "output", 0 ] } }
		]
	}
}

class_name TagUI
extends Control

@export var tag: Tag

var tag_in_range_texture: Texture2D = preload("res://assets/textures/tags/tag_in_range.png")
var tag_targeted_texture: Texture2D = preload("res://assets/textures/tags/tag_targeted.png")

@onready var icon: TextureRect = $icon
@onready var tag_panel: PanelContainer = $tag_panel
@onready var tag_label: RichTextLabel = $tag_panel/tag_label


func _process(_delta) -> void:
	if not tag.in_visible_range:
		hide()
		return

	show()

	if tag.targeted:
		icon.texture = tag_targeted_texture
		icon.size = Vector2(96.0, 96.0)
		icon.position = Vector2(80.0, 208.0)
		tag_panel.show()

		if tag.interactible:
			var prompt_path = InputPrompts.action_get_path(&"interact")
			var button_prompt_text: String = ""
			if prompt_path == "":
				button_prompt_text = "[" + InputPrompts.action_get_string(&"interact") + "]"
			else:
				button_prompt_text = "[img height=2em]" + prompt_path + "[/img]"

			tag_label.text = button_prompt_text + " " + tag.text
		else:
			tag_label.text = tag.text
	else:
		icon.texture = tag_in_range_texture
		icon.size = Vector2(192.0, 192.0)
		icon.position = Vector2(32.0, 160.0)
		tag_panel.hide()

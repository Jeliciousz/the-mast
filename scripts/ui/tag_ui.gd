class_name TagUI extends Control


@export var tag: Tag

var tag_in_range_texture: Texture2D = preload("res://assets/textures/tags/tag_in_range.png")
var tag_targeted_texture: Texture2D = preload("res://assets/textures/tags/tag_targeted.png")

@onready var icon: TextureRect = $icon
@onready var tag_panel: PanelContainer = $tag_panel
@onready var tag_label: RichTextLabel = $tag_panel/tag_label


func _physics_process(_delta) -> void:
	if not tag.in_visible_range:
		hide()
		return

	var cam = get_viewport().get_camera_3d()
	var depth = -cam.global_basis.z.dot(tag.global_position - cam.global_position)

	if depth <= cam.near:
		hide()
		return
	
	show()

	if tag.targeted:
		icon.texture = tag_targeted_texture
		icon.self_modulate = Color(1.0, 1.0, 1.0, 0.85)
		tag_panel.show()

		if tag.interactible:
			tag_label.text = "[img height=2.0em]res://assets/textures/input/e_key_dark.png[/img] " + tag.text
		else:
			tag_label.text = tag.text
	else:
		icon.texture = tag_in_range_texture
		icon.self_modulate = Color(1.0, 1.0, 1.0, 0.25)
		tag_panel.hide()

	position = cam.unproject_position(tag.global_position)
	scale = Vector2.ONE / depth

class_name TagInteractAudio
extends AudioStreamPlayer3D

var parent_tag: Tag

func _ready() -> void:
	if not get_parent() is Tag:
		printerr("TagInteractAudio should only be added to Tag nodes")

	parent_tag = get_parent()

	parent_tag.interacted.connect(_on_tag_interacted)


func _on_tag_interacted() -> void:
	play()

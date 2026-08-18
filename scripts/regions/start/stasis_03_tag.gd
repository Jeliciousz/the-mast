class_name Stasis03Tag
extends Tag


func _ready() -> void:
	EventsBus.subscribe(&"stasis_door_tag_interacted", _on_stasis_door_tag_interacted)


func _on_stasis_door_tag_interacted(_event) -> void:
	enabled = true

class_name StartOffStasisDoor
extends AnimatableBody3D

@export var final_position := Vector3.ZERO
var door_opened: bool = false
@onready var starting_position: Vector3 = position

func _ready() -> void:
	EventsBus.subscribe(&"stasis_door_tag_interacted", _on_stasis_door_tag_interacted)


func _on_stasis_door_tag_interacted(_event) -> void:
	if door_opened:
		return

	door_opened = true
	var door_open_tween := create_tween()
	door_open_tween.tween_property(self, "position", final_position, 1.0)

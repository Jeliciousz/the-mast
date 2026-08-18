class_name DynamicDoor
extends StaticBody3D

@export var open_door_position := Vector3.ZERO
@export var closed_door_position := Vector3.ZERO
@export var door_transition_time := 1.0
@export var open_event_id: StringName = &""
@export var close_event_id: StringName = &""
@onready var collision_shape: CollisionShape3D = $collision_shape
@onready var mesh: MeshInstance3D = $mesh


func _ready() -> void:
	if open_event_id != "":
		EventsBus.subscribe(open_event_id, _on_open_event_received)
	if close_event_id != "":
		EventsBus.subscribe(close_event_id, _on_close_event_received)


func _on_open_event_received(_event) -> void:
	collision_shape.disabled = true
	var door_open_tween := create_tween()
	door_open_tween.tween_property(mesh, "global_position", open_door_position, door_transition_time)


func _on_close_event_received(_event) -> void:
	collision_shape.disabled = false
	var door_close_tween := create_tween()
	door_close_tween.tween_property(mesh, "global_position", closed_door_position, door_transition_time)

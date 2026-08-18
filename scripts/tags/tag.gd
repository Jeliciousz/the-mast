class_name Tag
extends Sprite3D

signal interacted

@export var enabled: bool = true
@export var visible_range: float = 2.0
@export var interactible: bool = false
@export var event_id: StringName = ""
@export_multiline() var text: String = "Example Tag Text"

var in_visible_range: bool = false
var targeted: bool = false
var can_be_targeted: bool = false
var looking_at_dot: float = 0.0

@onready var player: Player = %player


func _physics_process(_delta) -> void:
	if not enabled:
		in_visible_range = false
		can_be_targeted = false
		return

	if not player.active:
		in_visible_range = false
		can_be_targeted = false
		return

	var distance_to_head = player.head.global_position.distance_to(global_position)
	if distance_to_head > visible_range:
		in_visible_range = false
		can_be_targeted = false
		return

	var tag_dir_dot: float = global_basis.z.dot(player.get_looking_direction())

	if tag_dir_dot <= 0:
		in_visible_range = false
		can_be_targeted = false
		return

	in_visible_range = true

	looking_at_dot = player.head.global_position.direction_to(global_position).dot(player.get_looking_direction())
	can_be_targeted = distance_to_head <= 1.5 and looking_at_dot >= 0.9


func _interacted() -> void:
	pass

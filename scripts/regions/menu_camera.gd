extends Camera3D

const BASE_PAN_TO_DURATION: float = 6.0
const BASE_PAN_FROM_DURATION: float = 4.0

var camera_fly_tween: Tween
var base_dist_from_player: float

@onready var player: Player = %player
@onready var menu_view_target: Marker3D = %menu_view_target


func _ready() -> void:
	await owner.ready

	base_dist_from_player = global_position.distance_to(player.head.global_position)


func fly_in_tween() -> Tween:
	if camera_fly_tween:
		camera_fly_tween.kill()

	var distance = global_position.distance_to(player.head.global_position)
	var relative_distance = distance / base_dist_from_player
	var pan_duration = BASE_PAN_TO_DURATION * clampf(relative_distance, 0.0, 1.0)
	camera_fly_tween = create_tween().set_ignore_time_scale(true)
	camera_fly_tween.tween_property(self, "global_transform", player.head.global_transform, pan_duration).set_trans(Tween.TRANS_CUBIC)

	return camera_fly_tween


func fly_out_tween() -> void:
	global_transform = player.head.global_transform

	if camera_fly_tween:
		camera_fly_tween.kill()

	var distance = global_position.distance_to(menu_view_target.global_position)
	var relative_distance = distance / base_dist_from_player
	var pan_duration = BASE_PAN_FROM_DURATION * clampf(relative_distance, 0.0, 1.0)
	camera_fly_tween = create_tween().set_ignore_time_scale(true)
	camera_fly_tween.tween_property(self, "global_transform", menu_view_target.global_transform, pan_duration).set_trans(Tween.TRANS_CUBIC)

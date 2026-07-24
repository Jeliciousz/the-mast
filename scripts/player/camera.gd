class_name PlayerCamera
extends Camera3D
## Controls the [Player]'s camera. Accounts for per-frame rotation, with interpolated translation.
## Animates the camera based on the Player's state.

## The [Player].
@export var player: Player
var last_head_position: Vector3 = Vector3.ZERO


func _process(_delta) -> void:
	global_position = player.head.get_global_transform_interpolated().origin
	global_rotation = player.head.global_rotation

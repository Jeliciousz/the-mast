class_name PlayerCamera
extends Camera3D
## Controls the [Player]'s camera. Interpolates position but not rotation.

## The [Player].
@export var player: Player


func _process(_delta) -> void:
	global_position = player.head.get_global_transform_interpolated().origin
	global_rotation = player.head.global_rotation

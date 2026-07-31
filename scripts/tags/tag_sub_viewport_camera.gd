extends Camera3D


func _process(_delta) -> void:
	var root_camera: Camera3D = get_tree().get_root().get_viewport().get_camera_3d()
	global_transform = root_camera.global_transform
	fov = root_camera.fov

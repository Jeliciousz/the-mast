class_name StartOnBody
extends StaticBody3D


func _ready() -> void:
	EventsBus.subscribe(&"generator_running", _on_generator_running)


func _on_generator_running(_event) -> void:
	show()
	process_mode = Node.PROCESS_MODE_INHERIT

class_name StartOffBody
extends StaticBody3D


func _ready() -> void:
	EventsBus.subscribe(&"generator_running", _on_generator_running)


func _on_generator_running(_event) -> void:
	hide()
	process_mode = Node.PROCESS_MODE_DISABLED

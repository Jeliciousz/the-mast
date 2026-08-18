class_name GeneratorAmbience
extends AudioStreamPlayer3D


func _ready() -> void:
	EventsBus.subscribe(&"generator_tag_interacted", _on_generator_tag_interacted)


func _on_generator_tag_interacted(_event) -> void:
	play()

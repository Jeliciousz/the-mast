class_name StartOnBody
extends StaticBody3D

@export var elevator_audio_stream: AudioStream


func _ready() -> void:
	EventsBus.subscribe(&"generator_running", _on_generator_running)
	EventsBus.subscribe(&"lift_door_close_tag_interacted", _on_lift_door_close_tag_interacted)


func _on_generator_running(_event) -> void:
	show()
	process_mode = Node.PROCESS_MODE_INHERIT


func _on_lift_door_close_tag_interacted(_event) -> void:
	await get_tree().create_timer(2.5, false).timeout

	SoundEffectsManager.spawn_sound_effect(elevator_audio_stream, -0.2, &"World")

	await get_tree().create_timer(10, false).timeout

	SceneTransition.start_transition(0.5, 0.5, 0.5)

	await SceneTransition.transition_fully_faded

	var surface_scene: PackedScene = load("res://scenes/regions/surface_region.tscn")
	get_tree().change_scene_to_packed(surface_scene)

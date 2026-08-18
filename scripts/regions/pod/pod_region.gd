class_name PodRegion
extends Node3D

@onready var player: Player = %player
@onready var pause_menu_ui: PauseMenuUI = $pause_menu_ui
@onready var menu_camera: Camera3D = $menu_camera


func _ready() -> void:
	EventsBus.subscribe(&"play_button_pressed", _on_play_button_pressed)
	EventsBus.subscribe(&"main_menu_button_pressed", _on_main_menu_button_pressed)
	EventsBus.subscribe(&"continue_tag_interacted", _on_continue_tag_interacted)
	PauseManager.unpause()


func _on_play_button_pressed(_event) -> void:
	await menu_camera.fly_in_tween().finished

	menu_camera.current = false
	player.camera.current = true
	pause_menu_ui.process_mode = Node.PROCESS_MODE_INHERIT

	if get_window().has_focus():
		player.activate()
	else:
		pause_menu_ui.pause()


func _on_main_menu_button_pressed(_event) -> void:
	PauseManager.unpause()

	player.camera.current = false
	menu_camera.current = true

	menu_camera.fly_out_tween()


func _on_continue_tag_interacted(_event) -> void:
	pause_menu_ui.process_mode = Node.PROCESS_MODE_DISABLED
	player.deactivate()
	SceneTransition.start_transition(2.0, 2.0, 0.0)

	await SceneTransition.transition_fully_faded

	var start_scene: PackedScene = load("res://scenes/regions/start_region.tscn")
	get_tree().change_scene_to_packed(start_scene)

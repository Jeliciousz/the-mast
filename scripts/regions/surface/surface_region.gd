class_name SurfaceRegion
extends Node3D

@onready var player: Player = %player
@onready var pause_menu_ui: PauseMenuUI = $pause_menu_ui


func _ready() -> void:
	EventsBus.subscribe(&"main_menu_button_pressed", _on_main_menu_button_pressed)


func _on_main_menu_button_pressed(_event) -> void:
	pause_menu_ui.process_mode = Node.PROCESS_MODE_DISABLED

	player.deactivate()

	SceneTransition.start_transition(1.0, 0.5, 1.0)

	await SceneTransition.transition_fully_faded

	var pod_scene: PackedScene = load("res://scenes/regions/pod_region.tscn")

	get_tree().change_scene_to_packed(pod_scene)

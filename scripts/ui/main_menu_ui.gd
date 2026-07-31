class_name MainMenuUI
extends Control

@export var menu_options_main_container: VBoxContainer
@export var menu_options_quit_container: VBoxContainer

var fade_tween: Tween


func _ready() -> void:
	EventsBus.subscribe(&"main_menu_button_pressed", _on_main_menu_button_pressed)
	EventsBus.subscribe(&"options_ui_opened", _on_options_ui_opened)
	EventsBus.subscribe(&"options_ui_closed", _on_options_ui_closed)

	if SceneTransition.in_transition:
		mouse_behavior_recursive = Control.MOUSE_BEHAVIOR_DISABLED

		await SceneTransition.transition_wait_finished

		mouse_behavior_recursive = Control.MOUSE_BEHAVIOR_INHERITED

	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func _on_main_menu_button_pressed(_event) -> void:
	process_mode = Node.PROCESS_MODE_INHERIT
	show()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

	if fade_tween:
		fade_tween.kill()

	fade_tween = create_tween()
	fade_tween.tween_property(self, "modulate", Color(1, 1, 1, 1), 1.0)

	await fade_tween.finished

	mouse_behavior_recursive = Control.MOUSE_BEHAVIOR_INHERITED


# Menu options: Main


func _on_play_button_pressed() -> void:
	EventsBus.broadcast(Event.new(&"play_button_pressed"))

	mouse_behavior_recursive = Control.MOUSE_BEHAVIOR_DISABLED
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

	if fade_tween:
		fade_tween.kill()

	fade_tween = create_tween()
	fade_tween.tween_property(self, "modulate", Color(1, 1, 1, 0), 1.0)

	await fade_tween.finished

	process_mode = Node.PROCESS_MODE_DISABLED
	hide()


func _on_options_button_pressed() -> void:
	EventsBus.broadcast(Event.new(&"options_ui_opened"))


func _on_quit_button_pressed() -> void:
	menu_options_main_container.hide()
	menu_options_quit_container.show()


# Menu options: Quit


func _on_quit_confirm_button_pressed() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED
	menu_options_quit_container.hide()
	EventsBus.broadcast(Event.new(&"quit_button_pressed"))


func _on_quit_deny_button_pressed() -> void:
	menu_options_quit_container.hide()
	menu_options_main_container.show()


func _on_options_ui_opened(_event) -> void:
	if process_mode == Node.PROCESS_MODE_DISABLED:
		return

	menu_options_main_container.hide()


func _on_options_ui_closed(_event) -> void:
	if process_mode == Node.PROCESS_MODE_DISABLED:
		return

	menu_options_main_container.show()

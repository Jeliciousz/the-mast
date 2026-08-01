class_name PauseMenuUI
extends Control

@export var menu_options_main_container: VBoxContainer
@export var menu_options_mm_container: VBoxContainer
@export var menu_options_quit_container: VBoxContainer

@onready var player: Player = %player


func _notification(what: int) -> void:
	if process_mode == PROCESS_MODE_DISABLED:
		return

	match what:
		NOTIFICATION_APPLICATION_FOCUS_OUT:
			if not PauseManager.is_paused():
				pause()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"ui_close_dialog"):
		get_viewport().set_input_as_handled()

		if PauseManager.is_paused():
			unpause()
		else:
			pause()


func _ready() -> void:
	EventsBus.subscribe(&"options_ui_opened", _on_options_ui_opened)
	EventsBus.subscribe(&"options_ui_closed", _on_options_ui_closed)


func pause() -> void:
	PauseManager.pause()
	show()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	player.deactivate()


func unpause() -> void:
	PauseManager.unpause()
	hide()
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	player.activate()


# Menu options: Main


func _on_continue_button_pressed() -> void:
	unpause()


func _on_options_button_pressed() -> void:
	EventsBus.broadcast(Event.new(&"options_ui_opened"))


func _on_main_menu_button_pressed() -> void:
	menu_options_main_container.hide()
	menu_options_mm_container.show()


func _on_quit_button_pressed() -> void:
	menu_options_main_container.hide()
	menu_options_quit_container.show()


# Menu options: Main Menu


func _on_mm_confirm_button_pressed() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED
	menu_options_mm_container.hide()
	menu_options_main_container.show()
	hide()
	EventsBus.broadcast(Event.new(&"main_menu_button_pressed"))


func _on_mm_deny_button_pressed() -> void:
	menu_options_mm_container.hide()
	menu_options_main_container.show()


func _on_quit_confirm_button_pressed() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED
	menu_options_quit_container.hide()
	menu_options_main_container.show()
	hide()
	EventsBus.broadcast(Event.new(&"quit_button_pressed"))


func _on_quit_deny_button_pressed() -> void:
	menu_options_quit_container.hide()
	menu_options_main_container.show()


# Events


func _on_options_ui_opened(_event) -> void:
	if process_mode == Node.PROCESS_MODE_DISABLED:
		return

	menu_options_main_container.hide()


func _on_options_ui_closed(_event) -> void:
	if process_mode == Node.PROCESS_MODE_DISABLED:
		return

	menu_options_main_container.show()

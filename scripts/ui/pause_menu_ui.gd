class_name PauseMenuUI extends Control


@export var menu_options_main_container: VBoxContainer
@export var menu_options_mm_container: VBoxContainer
@export var menu_options_quit_container: VBoxContainer


func _notification(what: int) -> void:
	if process_mode == PROCESS_MODE_DISABLED:
		return

	match what:
		NOTIFICATION_APPLICATION_FOCUS_OUT:
			if not PauseManager.is_paused():
				pause()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"pause"):
		if PauseManager.is_paused():
			unpause()
		else:
			pause()


func _ready() -> void:
	Events.options_window_opened.connect(_on_options_window_opened)
	Events.options_window_closed.connect(_on_options_window_closed)


func pause() -> void:
	PauseManager.pause()
	show()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func unpause() -> void:
	PauseManager.unpause()
	hide()
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


# Menu options: Main

func _on_continue_button_pressed() -> void:
	unpause()


func _on_options_button_pressed() -> void:
	Events.options_window_opened.emit()


func _on_main_menu_button_pressed() -> void:
	menu_options_main_container.hide()
	menu_options_mm_container.show()


func _on_quit_button_pressed() -> void:
	menu_options_main_container.hide()
	menu_options_quit_container.show()


# Menu options: Main Menu

func _on_mm_confirm_button_pressed() -> void:
	menu_options_mm_container.hide()
	menu_options_main_container.show()

	unpause()

	Events.main_menu_button_pressed.emit()


func _on_mm_deny_button_pressed() -> void:
	menu_options_mm_container.hide()
	menu_options_main_container.show()


func _on_quit_confirm_button_pressed() -> void:
	menu_options_quit_container.hide()
	menu_options_main_container.show()

	unpause()

	Events.quit_button_pressed.emit()


func _on_quit_deny_button_pressed() -> void:
	menu_options_quit_container.hide()
	menu_options_main_container.show()


func _on_options_window_opened() -> void:
	if process_mode == Node.PROCESS_MODE_DISABLED:
		return

	menu_options_main_container.hide()


func _on_options_window_closed() -> void:
	if process_mode == Node.PROCESS_MODE_DISABLED:
		return

	menu_options_main_container.show()

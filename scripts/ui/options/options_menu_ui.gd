class_name OptionsMenuUI extends Control


func _ready() -> void:
	Events.options_window_opened.connect(_on_options_window_opened)
	Events.options_window_closed.connect(_on_options_window_closed)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"ui_close_dialog"):
		get_viewport().set_input_as_handled()
		Events.options_window_closed.emit()


func _on_options_window_opened() -> void:
	process_mode = Node.PROCESS_MODE_INHERIT
	show()


func _on_options_window_closed() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED
	hide()


func _on_options_back_button_pressed() -> void:
	Events.options_window_closed.emit()

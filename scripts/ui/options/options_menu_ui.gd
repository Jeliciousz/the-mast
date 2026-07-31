class_name OptionsMenuUI
extends Control


func _ready() -> void:
	EventsBus.subscribe(&"options_ui_opened", _on_options_ui_opened)
	EventsBus.subscribe(&"options_ui_closed", _on_options_ui_closed)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"ui_close_dialog"):
		get_viewport().set_input_as_handled()
		EventsBus.broadcast(Event.new(&"options_ui_closed"))


func _on_options_ui_opened(_event) -> void:
	process_mode = Node.PROCESS_MODE_INHERIT
	show()


func _on_options_ui_closed(_event) -> void:
	process_mode = Node.PROCESS_MODE_DISABLED
	hide()


func _on_options_back_button_pressed() -> void:
	EventsBus.broadcast(Event.new(&"options_ui_closed"))

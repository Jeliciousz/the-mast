class_name FocusGrabber
extends Node

var parent_button: Button


func _ready() -> void:
	if not get_parent() is Button:
		printerr("FocusGrabber should only be added to Button nodes")

	parent_button = get_parent()

	InputMethod.input_method_changed.connect(_on_input_method_changed)
	parent_button.visibility_changed.connect(_on_visibility_changed)

	await owner.ready

	if parent_button.is_visible_in_tree():
		if InputMethod.active_input_method != InputMethod.ACTIVE_INPUT_KEYBOARD_AND_MOUSE:
			parent_button.grab_focus()


func _on_input_method_changed() -> void:
	if parent_button.is_visible_in_tree():
		if InputMethod.active_input_method != InputMethod.ACTIVE_INPUT_KEYBOARD_AND_MOUSE:
			parent_button.grab_focus()


func _on_visibility_changed() -> void:
	if parent_button.is_visible_in_tree():
		if InputMethod.active_input_method != InputMethod.ACTIVE_INPUT_KEYBOARD_AND_MOUSE:
			parent_button.grab_focus()

class_name OptionsCategoryContainer
extends VBoxContainer

@export var category: StringName


func _ready() -> void:
	Events.options_category_button_pressed.connect(_on_options_category_button_pressed)


func _on_options_category_button_pressed(category_pressed: StringName) -> void:
	if category_pressed == category:
		show()
	else:
		hide()

class_name OptionsCategoryContainer
extends VBoxContainer

@export var category: StringName


func _ready() -> void:
	EventsBus.subscribe(&"options_category_button_pressed", _on_options_category_button_pressed)


func _on_options_category_button_pressed(event: OptionsCategoryButton.OptionsCategoryButtonEvent) -> void:
	if event.category_pressed == category:
		show()
	else:
		hide()

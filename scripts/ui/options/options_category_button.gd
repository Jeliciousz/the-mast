class_name OptionsCategoryButton
extends Button

@export var category: StringName


func _ready() -> void:
	EventsBus.subscribe(&"options_category_button_pressed", _on_options_category_button_pressed)


func _pressed() -> void:
	EventsBus.broadcast(OptionsCategoryButtonEvent.new(category))


func _on_options_category_button_pressed(event: OptionsCategoryButtonEvent) -> void:
	if event.category_pressed == category:
		disabled = true
	else:
		disabled = false


class OptionsCategoryButtonEvent extends Event:
	const ID: StringName = &"options_category_button_pressed"

	var category_pressed: StringName


	func _init(category: StringName):
		super(ID)

		category_pressed = category

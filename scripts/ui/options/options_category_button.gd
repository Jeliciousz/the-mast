class_name OptionsCategoryButton
extends Button

@export var category: StringName = &""
@export var next_category: StringName = &""
@export var prev_category: StringName = &""


func _ready() -> void:
	EventsBus.subscribe(&"options_category_button_pressed", _on_options_category_button_pressed)


func _unhandled_input(event: InputEvent) -> void:
	if disabled and event.is_action_pressed(&"ui_page_up") and next_category != &"":
		get_viewport().set_input_as_handled()
		EventsBus.broadcast(OptionsCategoryButtonEvent.new(next_category))
		return
	if disabled and event.is_action_pressed(&"ui_page_down") and prev_category != &"":
		get_viewport().set_input_as_handled()
		EventsBus.broadcast(OptionsCategoryButtonEvent.new(prev_category))


func _pressed() -> void:
	EventsBus.broadcast(OptionsCategoryButtonEvent.new(category))


func _on_options_category_button_pressed(event: OptionsCategoryButtonEvent) -> void:
	if event.category_pressed == category:
		disabled = true
		if InputMethod.active_input_method != InputMethod.ACTIVE_INPUT_KEYBOARD_AND_MOUSE:
			grab_focus()
	else:
		disabled = false


class OptionsCategoryButtonEvent extends Event:
	const ID: StringName = &"options_category_button_pressed"

	var category_pressed: StringName


	func _init(category: StringName):
		super(ID)

		category_pressed = category

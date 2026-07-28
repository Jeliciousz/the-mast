class_name OptionsCategoryButton extends Button


@export var category: StringName


func _ready() -> void:
    Events.options_category_button_pressed.connect(_on_options_category_button_pressed)


func _pressed() -> void:
    Events.options_category_button_pressed.emit(category)


func _on_options_category_button_pressed(category_pressed: StringName) -> void:
    if category_pressed == category:
        disabled = true
    else:
        disabled = false
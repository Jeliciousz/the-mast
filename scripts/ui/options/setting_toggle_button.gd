class_name SettingToggleButton extends Button

@export var setting_name: StringName
@export var true_text: String = "True"
@export var false_text: String = "False"


func _ready() -> void:
	Settings.setting_changed.connect(_on_setting_changed)

	if setting_name == null:
		return

	button_pressed = Settings.get_setting(setting_name)

	if button_pressed:
		text = true_text
	else:
		text = false_text


func _toggled(toggled_on: bool) -> void:
	if setting_name == null:
		return

	Settings.set_setting(setting_name, toggled_on)


func _on_setting_changed(changed_setting_name: StringName, new_value: Variant) -> void:
	if setting_name == null:
		return

	if changed_setting_name != setting_name:
		return

	button_pressed = new_value

	if button_pressed:
		text = true_text
	else:
		text = false_text

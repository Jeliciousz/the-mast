class_name SettingOptionSlider
extends Slider

@export var setting_name: StringName


func _ready() -> void:
	Settings.setting_changed.connect(_on_setting_changed)

	if setting_name == null:
		return

	value = Settings.get_setting(setting_name)


func _value_changed(new_value: float) -> void:
	if setting_name == null:
		return

	if rounded:
		Settings.set_setting(setting_name, new_value as int)
	else:
		Settings.set_setting(setting_name, new_value)


func _on_setting_changed(changed_setting_name: StringName, new_value: Variant) -> void:
	if setting_name == null:
		return

	if changed_setting_name != setting_name:
		return

	value = new_value

class_name SettingOptionButton
extends OptionButton

@export var setting_name: StringName


func _ready() -> void:
	item_selected.connect(_on_item_selected)
	Settings.setting_changed.connect(_on_setting_changed)

	if setting_name == null:
		return

	selected = Settings.get_setting(setting_name)


func _on_item_selected(index: int) -> void:
	if setting_name == null:
		return

	Settings.set_setting(setting_name, index)


func _on_setting_changed(changed_setting_name: StringName, new_value: Variant) -> void:
	if setting_name == null:
		return

	if changed_setting_name != setting_name:
		return

	selected = new_value

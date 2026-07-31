extends SettingDisplay


func _on_setting_changed(changed_setting_name: StringName, new_value: Variant) -> void:
	super(changed_setting_name, new_value)

	if changed_setting_name == &"viewport_vsync":
		if new_value != Settings.VSYNC_DISABLED:
			text = "V-Sync"
		else:
			_format_display(Settings.get_setting(&"max_fps"))
		return

extends SettingOptionSlider


func _on_setting_changed(changed_setting_name: StringName, new_value: Variant) -> void:
    if changed_setting_name == &"vsync":
        if Settings.get_setting(&"vsync") == Settings.SETTING_VSYNC_DISABLED:
            editable = true
        else:
            editable = false

    super(changed_setting_name, new_value)
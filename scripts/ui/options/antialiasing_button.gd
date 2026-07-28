extends SettingOptionButton


func _on_setting_changed(changed_setting_name: StringName, new_value: Variant) -> void:
    if changed_setting_name == &"viewport_3d_scale" or changed_setting_name == &"viewport_filtering":
        var viewport_3d_scale = Settings.get_setting(&"viewport_3d_scale")
        var viewport_filtering = Settings.get_setting(&"viewport_filtering")

        if viewport_3d_scale == Settings.SETTING_3D_SCALE_150 or viewport_3d_scale == Settings.SETTING_3D_SCALE_200 or viewport_filtering == Settings.SETTING_FILTERING_FSR2:
            disabled = true
        else:
            disabled = false

    super(changed_setting_name, new_value)
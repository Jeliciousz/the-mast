extends SettingOptionButton


func _on_setting_changed(changed_setting_name: StringName, new_value: Variant) -> void:
    if changed_setting_name == &"viewport_3d_scale":
        if new_value == Settings.SETTING_3D_SCALE_150 or new_value == Settings.SETTING_3D_SCALE_200:
            disabled = true
        else:
            disabled = false

            if new_value == Settings.SETTING_3D_SCALE_100:
                get_popup().set_item_disabled(Settings.SETTING_FILTERING_BILINEAR, true)
                get_popup().set_item_disabled(Settings.SETTING_FILTERING_FSR, true)

                if selected == Settings.SETTING_FILTERING_BILINEAR or selected == Settings.SETTING_FILTERING_FSR:
                    Settings.set_setting(setting_name, Settings.SETTING_FILTERING_NEAREST)

            else:
                get_popup().set_item_disabled(Settings.SETTING_FILTERING_BILINEAR, false)
                get_popup().set_item_disabled(Settings.SETTING_FILTERING_FSR, false)

    super(changed_setting_name, new_value)
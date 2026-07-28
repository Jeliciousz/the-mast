extends SettingDisplay


func _on_setting_changed(changed_setting_name: StringName, new_value: Variant) -> void:
    if setting_name == null:
        return
    
    if changed_setting_name != setting_name:
        return

    if new_value is float:
        text = "%0.2f" % new_value
    elif new_value is int:
        text = "%d" % new_value
    elif new_value is Vector2 or new_value is Vector3 or new_value is Vector4 or new_value is Vector2i or new_value is Vector3i or new_value is Vector4i:
        text = "%v" % new_value
    else:
        text = "%s" % new_value
class_name SettingDisplay extends Label


@export var setting_name: StringName
@export_enum("default", "int", "float", "vector") var type: int = 0
@export var padding: int = 0
@export var precision: int = 2
@export var special_values: Dictionary[Variant, String] = {}


func _ready() -> void:
    Settings.setting_changed.connect(_on_setting_changed)

    if setting_name == null:
        return

    _format_display(Settings.get_setting(setting_name))    


func _on_setting_changed(changed_setting_name: StringName, new_value: Variant) -> void:
    if setting_name == null:
        return
    
    if changed_setting_name != setting_name:
        return

    _format_display(new_value)


func _format_display(value: Variant) -> void:
    if special_values.has(value):
        text = special_values.get(value)
        return

    if type == 0:
        text = "%s" % value
    elif type == 1:
        text = "%0*d" % [padding, value]
    elif type == 2:
        text = "%*.*f" % [padding, precision, value]
    elif type == 3:
        text = "%v" % value

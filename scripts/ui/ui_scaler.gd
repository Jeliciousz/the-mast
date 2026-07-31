class_name UIScaler extends Node


var parent_ui: Control


func _ready() -> void:
    if not get_parent() is Control:
        printerr("UIScaler should only be added to top-level control nodes")

    parent_ui = get_parent()

    Settings.setting_changed.connect(_on_setting_changed)

    match Settings.get_setting(&"ui_scale"):
        0.75:
            parent_ui.theme = preload("res://themes/main_0.75x.tres")
        1.0:
            parent_ui.theme = preload("res://themes/main_1x.tres")
        2.0:
            parent_ui.theme = preload("res://themes/main_2x.tres")
        3.0:
            parent_ui.theme = preload("res://themes/main_3x.tres")
        4.0:
            parent_ui.theme = preload("res://themes/main_4x.tres")


func _on_setting_changed(setting_name: StringName, new_value: Variant) -> void:
    if setting_name == &"ui_scale":
        match new_value:
            0.75:
                parent_ui.theme = preload("res://themes/main_0.75x.tres")
            1.0:
                parent_ui.theme = preload("res://themes/main_1x.tres")
            2.0:
                parent_ui.theme = preload("res://themes/main_2x.tres")
            3.0:
                parent_ui.theme = preload("res://themes/main_3x.tres")
            4.0:
                parent_ui.theme = preload("res://themes/main_4x.tres")

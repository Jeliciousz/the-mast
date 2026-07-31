extends Label


var format_string = "FPS: %d"


func _ready() -> void:
    Settings.setting_changed.connect(_on_setting_changed)

    if Settings.setting_exists(&"show_fps"):
        if Settings.get_setting(&"show_fps"):
            show()
            process_mode = Node.PROCESS_MODE_INHERIT
        else:
            hide()
            process_mode = Node.PROCESS_MODE_DISABLED


func _on_setting_changed(setting_name: StringName, new_value: Variant) -> void:
    if setting_name == &"show_fps":
        if new_value:
            show()
            process_mode = Node.PROCESS_MODE_INHERIT
        else:
            hide()
            process_mode = Node.PROCESS_MODE_DISABLED


func _process(_delta) -> void:
    text = format_string % Engine.get_frames_per_second()

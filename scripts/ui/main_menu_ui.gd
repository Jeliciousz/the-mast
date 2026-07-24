class_name MainMenuUI extends Control


func ignore_input() -> void:
    mouse_behavior_recursive = Control.MOUSE_BEHAVIOR_DISABLED


func restore_input() -> void:
    mouse_behavior_recursive = Control.MOUSE_BEHAVIOR_INHERITED


func disable() -> void:
    process_mode = Node.PROCESS_MODE_DISABLED
    hide()


func enable() -> void:
    process_mode = Node.PROCESS_MODE_INHERIT
    show()

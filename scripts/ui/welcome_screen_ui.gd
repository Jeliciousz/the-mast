extends Control


@onready var player: Player = %player


func _unhandled_input(event: InputEvent) -> void:
    if event.is_action_pressed(&"ui_close_dialog") or event.is_action_pressed(&"interact"):
        get_viewport().set_input_as_handled()

        player.activate()
        Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
        process_mode = Node.PROCESS_MODE_DISABLED
        hide()


func _on_tag_interacted() -> void:
    player.deactivate()
    Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
    process_mode = Node.PROCESS_MODE_INHERIT
    show()
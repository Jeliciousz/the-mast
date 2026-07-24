extends Control


func _ready() -> void:
    Events.game_paused.connect(_game_paused)
    Events.game_unpaused.connect(_game_unpaused)


func _game_paused() -> void:
    process_mode = Node.PROCESS_MODE_INHERIT
    Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
    show()


func _game_unpaused() -> void:
    process_mode = Node.PROCESS_MODE_DISABLED
    Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
    hide()

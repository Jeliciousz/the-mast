extends Node


var _enabled: bool = false
var _paused: bool = false


func _notification(what: int) -> void:
    if not _enabled:
        return

    match what:
        NOTIFICATION_APPLICATION_FOCUS_OUT:
            if not _paused:
                pause_game()


func _ready() -> void:
    Events.continue_game_pressed.connect(unpause_game)


func _process(_delta) -> void:
    if not _enabled:
        return

    if Input.is_action_just_pressed(&"ui_close_dialog"):
        if _paused:
            unpause_game()    
        else:
            pause_game()


func is_pausing_enabled() -> bool:
    return _enabled


func enable_pausing() -> void:
    _enabled = true


func disable_pausing() -> void:
    _enabled = false


func is_paused() -> bool:
    return _paused


func pause_game() -> void:
    if not _enabled or _paused:
        return

    _paused = true
    Engine.time_scale = 0.0

    Events.game_paused.emit()


func unpause_game() -> void:
    if not _enabled or not _paused:
        return

    _paused = false
    Engine.time_scale = 1.0

    Events.game_unpaused.emit()
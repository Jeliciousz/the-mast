extends Node


var _paused: bool = false


func is_paused() -> bool:
    return _paused


func pause() -> void:
    if _paused:
        return

    _paused = true
    Engine.time_scale = 0.0

    Events.game_paused.emit()


func unpause() -> void:
    if not _paused:
        return

    _paused = false
    Engine.time_scale = 1.0

    Events.game_unpaused.emit()
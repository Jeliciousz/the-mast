extends Control


@onready var player: Player = %player


func _on_welcome_screen_tag_interacted() -> void:
    player.deactivate()
    Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
    show()

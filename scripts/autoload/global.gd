extends Node
## The Global autoload


func _ready() -> void:
    Events.quit_game_pressed.connect(_quit_game)


func _quit_game() -> void:
    get_tree().quit()
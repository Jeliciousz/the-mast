extends Node
## Manages general global things (like quitting the game)


func _ready() -> void:
	EventsBus.subscribe(&"quit_button_pressed", _quit_game)


func _quit_game(_event) -> void:
	SceneTransition.start_transition(0.5, 0.0, 0.0)

	await SceneTransition.transition_fully_faded

	get_tree().quit()

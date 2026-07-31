class_name ButtonSFX
extends Node

@export var hover_stream: AudioStream = preload("res://assets/audio/ui/hover.ogg")
@export var press_stream: AudioStream = preload("res://assets/audio/ui/click.ogg")

var parent_button: Button


func _ready() -> void:
	if not get_parent() is Button:
		printerr("ButtonSFX should only be added to button control nodes")

	parent_button = get_parent()

	parent_button.mouse_entered.connect(_on_mouse_entered)
	parent_button.pressed.connect(_on_pressed)


func _on_pressed() -> void:
	SoundEffectsManager.spawn_sound_effect(press_stream, linear_to_db(0.25), &"UI")


func _on_mouse_entered() -> void:
	if parent_button.disabled:
		return

	SoundEffectsManager.spawn_sound_effect(hover_stream, linear_to_db(0.25), &"UI")

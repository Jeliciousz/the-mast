class_name MenuOptionButton extends Button


@export var hover_audio: AudioStream = preload("res://assets/audio/ui/hover.ogg")
@export var click_audio: AudioStream = preload("res://assets/audio/ui/click.ogg")


var sound_effect = preload("res://scenes/sound_effect.scn")

var target_position_x: float = 0.0


func _ready() -> void:
	GlobalTime.unscaled_process.connect(_unscaled_process)


func _on_mouse_entered() -> void:
	target_position_x = -20

	var hover_sound_effect: SoundEffect = sound_effect.instantiate()
	hover_sound_effect.stream = hover_audio
	hover_sound_effect.volume_linear = 0.25

	get_tree().root.add_child(hover_sound_effect)


func _on_mouse_exited() -> void:
	target_position_x = 0.0


func _on_pressed() -> void:
	var click_sound_effect: SoundEffect = sound_effect.instantiate()
	click_sound_effect.stream = click_audio
	click_sound_effect.volume_linear = 0.25

	get_tree().root.add_child(click_sound_effect)


func _unscaled_process(delta: float) -> void:
	position.x = lerp(position.x, target_position_x, 10.0 * delta)
	size.x = 481 - global_position.x

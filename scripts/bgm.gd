class_name BGM
extends AudioStreamPlayer


func _ready() -> void:
	SceneTransition.transition_started.connect(_transition_started)


func _transition_started(fade_in_duration: float) -> void:
	var fade_tween = create_tween()
	fade_tween.tween_property(self, "volume_linear", 0.0, fade_in_duration)

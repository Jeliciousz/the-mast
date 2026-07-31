extends Control
## A global transition effect

signal transition_started(fade_in_duration: float)
signal transition_fully_faded(wait_duration: float)
signal transition_wait_finished(fade_out_duration: float)
signal transition_finished

var in_transition: bool = false
var waiting: bool = false

@onready var fade_rect: ColorRect = $fade_rect


func start_transition(
		fade_in_duration: float,
		wait_duration: float,
		fade_out_duration: float
) -> void:
	var transition_tween = create_tween()
	transition_tween.tween_callback(
			func():
				in_transition = true
				transition_started.emit(fade_in_duration)
	)
	transition_tween.tween_property(
			fade_rect,
			"color",
			Color.BLACK,
			fade_in_duration)
	transition_tween.tween_callback(
			func():
				waiting = true
				transition_fully_faded.emit(wait_duration)
	)
	transition_tween.tween_interval(wait_duration)
	transition_tween.tween_callback(
			func():
				waiting = false
				transition_wait_finished.emit(fade_out_duration)
	)
	transition_tween.tween_property(
			fade_rect,
			"color",
			Color(0.0, 0.0, 0.0, 0.0),
			fade_out_duration
	)
	transition_tween.tween_callback(
			func():
				in_transition = false
				transition_finished.emit()
	)

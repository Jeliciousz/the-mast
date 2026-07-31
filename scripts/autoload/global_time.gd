extends Node
## Maintains a global timer and tracks frame times unmodified by the time_scale

signal unscaled_process(delta: float)

var _time: float = 0.0
var _physics_time: float = 0.0
var _unscaled_delta: float
var _last_frame_time: int


func _enter_tree() -> void:
	_last_frame_time = Time.get_ticks_usec()

	RenderingServer.frame_post_draw.connect(_frame_post_draw)


func _process(delta: float) -> void:
	_time += delta


func _physics_process(delta: float) -> void:
	_physics_time += delta


func _frame_post_draw() -> void:
	var now = Time.get_ticks_usec()
	_unscaled_delta = float(now - _last_frame_time) / 1000000
	_last_frame_time = now

	unscaled_process.emit(_unscaled_delta)


func get_time() -> float:
	return _time


func get_physics_time() -> float:
	return _physics_time


func get_unscaled_delta_time() -> float:
	return _unscaled_delta


func reset_time() -> void:
	_time = 0.0
	_physics_time = 0.0

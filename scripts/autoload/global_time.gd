extends Node
## Maintains a global timer and tracks frame times unmodified by the time_scale

var time: float = 0.0
var physics_time: float = 0.0


func _process(delta: float) -> void:
	time += delta


func _physics_process(delta: float) -> void:
	physics_time += delta

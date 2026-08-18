class_name GeneratorTag
extends Tag


func _interacted() -> void:
	interactible = false
	text = "starting..."
	visible_range = 2.0

	await get_tree().create_timer(5.0, false).timeout

	EventsBus.broadcast(Event.new(&"generator_running"))

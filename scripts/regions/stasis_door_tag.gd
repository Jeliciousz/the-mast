class_name StasisDoorTag
extends Tag

func _ready() -> void:
	interacted.connect(_on_interacted)
	EventsBus.subscribe(&"terminal_tag_interacted", _on_terminal_tag_interacted)


func _on_terminal_tag_interacted(_event) -> void:
	text = "open door"
	interactible = true


func _on_interacted() -> void:
	enabled = false

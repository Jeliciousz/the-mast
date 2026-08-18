class_name TagsController
extends Node

var targeted_tag: Tag

@onready var player: Player = %player


func _unhandled_input(event: InputEvent) -> void:
	if targeted_tag == null:
		return

	if not targeted_tag.interactible:
		return

	if event.is_action_pressed(&"interact"):
		get_viewport().set_input_as_handled()
		targeted_tag._interacted()
		targeted_tag.interacted.emit()
		EventsBus.broadcast(Event.new(targeted_tag.event_id))


func _physics_process(_delta) -> void:
	if not player.active:
		if targeted_tag:
			_reset_targeted_tag()

		return

	_find_targeted_tag()


func _find_targeted_tag() -> void:
	if targeted_tag:
		if not targeted_tag.can_be_targeted:
			_reset_targeted_tag()

	for tag: Tag in get_tree().get_nodes_in_group(&"tags"):
		if not (tag.visible and tag.process_mode != PROCESS_MODE_DISABLED and tag.enabled):
			continue

		if targeted_tag and tag == targeted_tag:
			continue

		if not tag.can_be_targeted:
			continue

		if not targeted_tag:
			tag.targeted = true
			targeted_tag = tag
		elif tag.looking_at_dot > targeted_tag.looking_at_dot:
			_reset_targeted_tag()
			tag.targeted = true
			targeted_tag = tag


func _reset_targeted_tag() -> void:
	targeted_tag.targeted = false
	targeted_tag = null

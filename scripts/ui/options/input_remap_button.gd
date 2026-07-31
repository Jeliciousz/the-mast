class_name InputRemapButton extends Button

@export var action: StringName = ""
@export var action_event_index: int = 0

@export var key_events_allowed: bool = true
@export var joypad_button_events_allowed: bool = true
@export var mouse_button_events_allowed: bool = true


func _ready() -> void:
	toggle_mode = true
	_toggled(false)


func _unhandled_input(event: InputEvent) -> void:
	if not InputMap.has_action(action) or not is_pressed():
		return

	if not event.is_pressed():
		return

	get_viewport().set_input_as_handled()

	if event.is_action("ui_cancel"):
		button_pressed = false
		release_focus()
		return

	if (event is InputEventKey and key_events_allowed) or (event is InputEventJoypadButton and joypad_button_events_allowed) or (event is InputEventMouseButton and mouse_button_events_allowed):
		var action_events_list = InputMap.action_get_events(action)
		if action_event_index >= action_events_list.size():
			action_events_list.resize(action_event_index + 1)

		action_events_list[action_event_index] = event
		InputMap.action_erase_events(action)
		for action_event in action_events_list:
			InputMap.action_add_event(action, action_event)

	button_pressed = false
	release_focus()


func _toggled(toggled_on: bool) -> void:
	if not action or not InputMap.has_action(action):
		return

	if toggled_on:
		icon = null
		text = "..."
		return

	if action_event_index >= InputMap.action_get_events(action).size() or InputMap.action_get_events(action)[action_event_index] == null:
		text = " "
		icon = null
		return

	var input_event = InputMap.action_get_events(action)[action_event_index]
	if input_event is InputEventJoypadButton:
		if InputPrompts.INPUT_PROMPT_XBOX_BUTTON_PATHS.has(input_event.button_index):
			text = ""
			icon = load(InputPrompts.INPUT_PROMPT_XBOX_BUTTON_PATHS.get(input_event.button_index))
		else:
			icon = null
			text = InputPrompts.INPUT_PROMPT_XBOX_BUTTON_STRINGS.get(input_event.button_index)
	elif input_event is InputEventKey:
		var key = input_event.physical_keycode if input_event.physical_keycode != 0 else input_event.keycode

		if InputPrompts.INPUT_PROMPT_WIN_KEY_PATHS.has(key):
			text = ""
			icon = load(InputPrompts.INPUT_PROMPT_WIN_KEY_PATHS.get(key))
		else:
			icon = null
			text = OS.get_keycode_string(key)

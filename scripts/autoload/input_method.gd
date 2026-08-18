extends Node

signal input_method_changed

const ACTIVE_INPUT_KEYBOARD_AND_MOUSE: int = 0
const ACTIVE_INPUT_XBOX: int = 1
const ACTIVE_INPUT_XBOX_360: int = 2

var active_input_method: int = ACTIVE_INPUT_KEYBOARD_AND_MOUSE
var active_joypad_id: int = -1
var desired_mouse_mode: Input.MouseMode = Input.MOUSE_MODE_VISIBLE:
	set = _set_desired_mouse_mode


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	Input.joy_connection_changed.connect(_on_joy_connection_changed)


func _input(event: InputEvent) -> void:
	if event is InputEventJoypadButton or event is InputEventJoypadMotion and absf(event.axis_value) >= 0.5:
		if active_joypad_id == -1:
			active_joypad_id = event.device
		elif active_joypad_id != event.device:
			return

		var joy_name = Input.get_joy_name(active_joypad_id)

		# There are so many different controllers with so many
		# different names all for the same standards,
		# so let's just naively hope that all xbox-type controllers have "xbox" in their names
		# And that all xbox 360 controllers, also have "360" in their names
		if joy_name.containsn("xbox") and joy_name.containsn("360"):
			if active_input_method != ACTIVE_INPUT_XBOX_360:
				active_input_method = ACTIVE_INPUT_XBOX_360
				Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
				input_method_changed.emit()
		else:
			# Other controllers are intended to be recognized in the future,
			# but XBOX will always be the fallback
			if active_input_method != ACTIVE_INPUT_XBOX:
				active_input_method = ACTIVE_INPUT_XBOX
				Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
				input_method_changed.emit()
	elif event is InputEventMouse or event is InputEventKey:
		if active_input_method != ACTIVE_INPUT_KEYBOARD_AND_MOUSE:
			active_input_method = ACTIVE_INPUT_KEYBOARD_AND_MOUSE
			Input.mouse_mode = desired_mouse_mode
			get_viewport().gui_release_focus()
			input_method_changed.emit()


func _on_joy_connection_changed(device: int, connected: bool) -> void:
	if not connected and device == active_joypad_id:
		active_joypad_id = -1


func _set_desired_mouse_mode(new_value: Input.MouseMode) -> void:
	desired_mouse_mode = new_value

	if active_input_method == ACTIVE_INPUT_KEYBOARD_AND_MOUSE:
		Input.mouse_mode = desired_mouse_mode
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

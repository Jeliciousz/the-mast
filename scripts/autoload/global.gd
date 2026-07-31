extends Node
## Manages general global things (like quitting the game)

const ACTIVE_INPUT_KEYBOARD_MOUSE: int = 0
const ACTIVE_INPUT_XBOX: int = 1
const ACTIVE_INPUT_XBOX360: int = 2

var active_input_method: int = ACTIVE_INPUT_KEYBOARD_MOUSE
var active_joypad_id: int = -1


func _ready() -> void:
	Events.quit_button_pressed.connect(_quit_game)
	Input.joy_connection_changed.connect(_on_joy_connection_changed)


func _input(event: InputEvent) -> void:
	if (
			event is InputEventJoypadButton
			or event is InputEventJoypadMotion and absf(event.axis_value) >= 0.5
	):
		if active_joypad_id == -1:
			active_joypad_id = event.device
		if active_joypad_id != event.device:
			return

		var joy_name = Input.get_joy_name(active_joypad_id)

		# There are so many different controllers with so many
		# different names all for the same standards,
		# so let's just naively hope that all xbox-type controllers have "xbox" in their names
		# And that all xbox 360 controllers, also have "360" in their names
		if joy_name.containsn("xbox") and joy_name.containsn("360"):
			active_input_method = ACTIVE_INPUT_XBOX360
		else:
			# Other controllers are intended to be recognized in the future,
			# but XBOX will always be the fallback
			active_input_method = ACTIVE_INPUT_XBOX
	elif event is InputEventMouse or event is InputEventKey:
		active_input_method = ACTIVE_INPUT_KEYBOARD_MOUSE


func _quit_game() -> void:
	get_tree().quit()


func _on_joy_connection_changed(device: int, connected: bool) -> void:
	if not connected and device == active_joypad_id:
		active_joypad_id = -1

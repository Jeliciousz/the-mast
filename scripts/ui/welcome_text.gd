class_name WelcomeScreenText
extends RichTextLabel

var welcome_text_format: String = """[color=#00ff76]Welcome.[br]
You are currently situated in a pod.[br]
Use this opportunity to get used to the controls before the game is started.[br]
Please note: This is a Godot recreation of the Scratch game "The Mast [3D]" by awesome-llama. Please check out the original creator on Scratch.[/color]

[color=#ffe283]Below are the controls:[/color]
	MOVE: %s
	LOOK: %s
	INTERACT: %s
	RUN: %s
[color=#ffe283]You can change these controls, look sensitivity, and more in the Options menu, which you can find by pressing %s after closing this screen.[/color]"""

var mouse_img: String = "[img height=2em]res://assets/textures/input_prompts/keyboard_and_mouse/mouse.png[/img]"
var xbox_stick_l_img: String = "[img height=2em]res://assets/textures/input_prompts/xbox/xbox_stick_top_l.png[/img]"
var xbox_stick_r_img: String = "[img height=2em]res://assets/textures/input_prompts/xbox/xbox_stick_top_r.png[/img]"


func _process(_delta) -> void:
	var move_controls_string: String = ""
	var look_controls_string: String = ""
	if InputMethod.active_input_method == InputMethod.ACTIVE_INPUT_KEYBOARD_AND_MOUSE:
		move_controls_string = _get_prompt_text(&"move_forward") + _get_prompt_text(&"move_left") + _get_prompt_text(&"move_back") + _get_prompt_text(&"move_right")
		look_controls_string = mouse_img + " / " + _get_prompt_text(&"look_up") + _get_prompt_text(&"look_left") + _get_prompt_text(&"look_down") + _get_prompt_text(&"look_right")
	elif InputMethod.active_input_method == InputMethod.ACTIVE_INPUT_XBOX or InputMethod.active_input_method == InputMethod.ACTIVE_INPUT_XBOX_360:
		move_controls_string = xbox_stick_l_img
		look_controls_string = xbox_stick_r_img

	text = welcome_text_format % [move_controls_string, look_controls_string, _get_prompt_text(&"interact"), _get_prompt_text(&"run"), _get_prompt_text(&"ui_close_dialog")]


func _get_prompt_text(action: StringName) -> String:
	var prompt_path = InputPrompts.action_get_path(action)
	var button_prompt_text: String = ""
	if prompt_path == "":
		button_prompt_text = "[" + InputPrompts.action_get_string(action) + "]"
	else:
		button_prompt_text = "[img height=2em]" + prompt_path + "[/img]"

	return button_prompt_text

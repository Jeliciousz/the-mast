class_name CloseDocumentText
extends RichTextLabel


func _process(_delta) -> void:
	var prompt_path = InputPrompts.action_get_path(&"interact")
	var button_prompt_text: String = ""
	if prompt_path == "":
		button_prompt_text = "[" + InputPrompts.action_get_string(&"interact") + "]"
	else:
		button_prompt_text = "[img height=2em]" + prompt_path + "[/img]"

	text = "[color=#f0dc00]" + button_prompt_text + " to close[/color]"

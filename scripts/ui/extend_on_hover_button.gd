class_name ExtendOnHoverButton extends Button

@export var extend_amount: float = -20.0

var _target_position_x: float = 0.0


func _ready() -> void:
	GlobalTime.unscaled_process.connect(_unscaled_process)


func _unscaled_process(delta: float) -> void:
	if not is_inside_tree():
		return

	if is_hovered() or has_focus(true):
		_target_position_x = extend_amount * Settings.get_setting(&"ui_scale")
	else:
		_target_position_x = 0.0

	position.x = lerp(position.x, _target_position_x, 10.0 * delta)
	size.x = ceilf(get_viewport_rect().size.x + global_position.x)

class_name AimController
extends Node
## Rotates a player and a head for FPS camera control with the mouse, keyboard, or joypad.
##
## [url=https://yosoyfreeman.github.io/article/godot/tutorial/achieving-better-mouse-input-in-godot-4-the-perfect-camera-controller/]Yo Soy Freeman[/url].
## Edited by Jeliciousz

## How many radians should the camera rotate per dot of mouse movement.
const RADIANS_PER_DOT: float = deg_to_rad(0.1)

## Is aiming currently enabled
@export var active: bool = true

## Settings.
@export_group("Settings")

## Mouse settings.
@export_subgroup("Mouse")

## How sensitive aiming is.
@export var mouse_sensitivity: Vector2 = Vector2(1.0, 1.0)

## Keyboard/Joystick settings.
@export_subgroup("Look")

## How sensitive aiming is.
@export var look_sensitivity: Vector2 = Vector2(2.0, 2.0)

@export var look_response_curve: float = 2.0

@export var look_full_deflection_boost: float = 3.0

@export var look_full_deflection_duration: float = 1.5

## Camera pitch clamping.
@export_subgroup("Clamping")

## Whether the camera pitch will be clamped
@export var clamping_enabled: bool = true

## Maximum camera pitch in radians.
@export_range(0, 90, 0.5, "radians_as_degrees") var max_pitch: float = deg_to_rad(90)

## Minimum camera pitch in radians.
@export_range(-90, 0, 0.5, "radians_as_degrees") var min_pitch: float = deg_to_rad(-90)

## Node references.
@export_group("Nodes")

## The player.
@export var player: Player

## The head.
@export var head: Node3D

var full_deflection: bool = false
var full_deflection_time: float = 0.0


func _ready() -> void:
	Settings.setting_changed.connect(_on_setting_changed)

	look_sensitivity.x = Settings.get_setting(&"look_sensitivity")
	look_sensitivity.y = Settings.get_setting(&"look_sensitivity")
	mouse_sensitivity.x = Settings.get_setting(&"look_sensitivity_mouse")
	mouse_sensitivity.y = Settings.get_setting(&"look_sensitivity_mouse")


func _unhandled_input(event: InputEvent) -> void:
	if not (active and player.active):
		return

	if event is InputEventMouseMotion:
		_aim_mouse(event)


func _process(delta: float) -> void:
	if not (active and player.active):
		return

	var look_vector := Input.get_vector(&"look_left", &"look_right", &"look_up", &"look_down")
	var look_deflection = look_vector.length()

	if not full_deflection:
		if look_deflection >= 0.98:
			full_deflection = true
			full_deflection_time = GlobalTime.time
		else:
			look_vector *= ease(clampf(look_deflection, 0.0, 1.0), look_response_curve)
	else:
		if look_deflection < 0.98:
			full_deflection = false
			look_vector *= ease(clampf(look_deflection, 0.0, 1.0), look_response_curve)
		else:
			look_vector *= lerpf(1.0, look_full_deflection_boost, clampf((GlobalTime.time - full_deflection_time) / look_full_deflection_duration, 0.0, 1.0))

	_add_yaw(look_sensitivity.x * PI * look_vector.x * delta)
	_add_pitch(look_sensitivity.y * PI * look_vector.y * delta)

	if clamping_enabled:
		_clamp_pitch()


## Handles aiming with the mouse.
func _aim_mouse(event: InputEventMouseMotion) -> void:
	var viewport_transform: Transform2D = get_tree().get_root().get_final_transform()
	var motion: Vector2 = event.xformed_by(viewport_transform).relative

	motion *= RADIANS_PER_DOT
	motion *= mouse_sensitivity

	_add_yaw(motion.x)
	_add_pitch(motion.y)

	if clamping_enabled:
		_clamp_pitch()


## Rotates the player around the local Y axis by a given amount (in radians) to achieve yaw.
func _add_yaw(amount: float) -> void:
	if is_zero_approx(amount):
		return

	player.rotate_object_local(Vector3.DOWN, amount)
	player.orthonormalize()


## Rotates the head around the local x axis by a given amount (in radians) to achieve pitch.
func _add_pitch(amount: float) -> void:
	if is_zero_approx(amount):
		return

	head.rotate_object_local(Vector3.LEFT, amount)
	head.orthonormalize()


## Clamps the pitch between min_pitch and max_pitch.
func _clamp_pitch() -> void:
	if head.rotation.x > min_pitch and head.rotation.x < max_pitch:
		return

	head.rotation.x = clamp(head.rotation.x, min_pitch, max_pitch)
	head.orthonormalize()


func _on_setting_changed(setting_name: StringName, new_value: Variant) -> void:
	if setting_name == &"look_sensitivity_mouse":
		mouse_sensitivity.x = new_value
		mouse_sensitivity.y = new_value
		return
	if setting_name == &"look_sensitivity":
		look_sensitivity.x = new_value
		look_sensitivity.y = new_value

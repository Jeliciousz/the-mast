class_name MouseAimController
extends Node
## Rotates a player and a head for FPS camera control with the mouse.
##
## [url=https://yosoyfreeman.github.io/article/godot/tutorial/achieving-better-mouse-input-in-godot-4-the-perfect-camera-controller/]Yo Soy Freeman[/url].
## Edited by Jeliciousz

## How many radians should the camera rotate per dot of mouse movement.
const RADIANS_PER_DOT: float = deg_to_rad(0.1)

## Is mouse aiming currently enabled
@export var active: bool = true

## Settings.
@export_group("Settings")

## Mouse settings.
@export_subgroup("Mouse")

## How sensitive aiming is.
@export var sensitivity: Vector2 = Vector2(1.0, 1.0)

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


func _ready() -> void:
    Settings.setting_changed.connect(_on_setting_changed)

    if Settings.setting_exists(&"player_look_sensitivity"):
        var sens = Settings.get_setting(&"player_look_sensitivity")
        sensitivity = Vector2(sens, sens)


func _on_setting_changed(setting_name: StringName, new_value: Variant) -> void:
    if setting_name == &"player_look_sensitivity":
        var sens = new_value
        sensitivity = Vector2(sens, sens)


func _unhandled_input(event: InputEvent) -> void:
    if not (active and player.active):
        return

    if event is InputEventMouseMotion:
        aim(event)


func _physics_process(delta: float) -> void:
    if not (active and player.active):
        return

    var look_vector := Vector2.ZERO

    look_vector.x = Input.get_joy_axis(0, JOY_AXIS_RIGHT_X)
    look_vector.y = Input.get_joy_axis(0, JOY_AXIS_RIGHT_Y)

    if look_vector.length() < 0.1:
        look_vector = Vector2.ZERO

    look_vector *= ease(look_vector.length(), 2.0)

    add_yaw(1.5 * PI * look_vector.x * delta)
    add_pitch(1.5 * PI * look_vector.y * delta)

    if clamping_enabled:
        clamp_pitch()


## Handles aiming with the mouse.
func aim(event: InputEventMouseMotion) -> void:
    var viewport_transform: Transform2D = get_tree().get_root().get_final_transform()
    var motion: Vector2 = event.xformed_by(viewport_transform).relative

    motion *= RADIANS_PER_DOT
    motion *= sensitivity

    add_yaw(motion.x)
    add_pitch(motion.y)

    if clamping_enabled:
        clamp_pitch()


## Rotates the player around the local Y axis by a given amount (in radians) to achieve yaw.
func add_yaw(amount: float) -> void:
    if is_zero_approx(amount):
        return

    player.rotate_object_local(Vector3.DOWN, amount)
    player.orthonormalize()


## Rotates the head around the local x axis by a given amount (in radians) to achieve pitch.
func add_pitch(amount: float) -> void:
    if is_zero_approx(amount):
        return

    head.rotate_object_local(Vector3.LEFT, amount)
    head.orthonormalize()


## Clamps the pitch between min_pitch and max_pitch.
func clamp_pitch() -> void:
    if head.rotation.x > min_pitch and head.rotation.x < max_pitch:
        return

    head.rotation.x = clamp(head.rotation.x, min_pitch, max_pitch)
    head.orthonormalize()

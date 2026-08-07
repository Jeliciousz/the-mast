class_name Player
extends CharacterBody3D
## The Player controller.

## Is the [Player] currently able to be controlled by the user?
@export var active: bool = false

@export_group("Physics", "physics_")

## The acceleration applied opposite and proportional to the player's velocity.
@export_range(0.0, 1.0, 0.001, "suffix:m/s/s") var physics_resistence: float = 5.0

## How much gravity is applied to the player.
@export_range(0.0, 1.0, 0.05, "suffix:×") var physics_gravity_multiplier: float = 1.0

@export_group("Movement", "move_")

## The player's top grounded _move speed.
@export_range(0.0, 100.0, 0.05, "suffix:m/s") var move_speed: float = 1.9

## How quickly the player accelerates.
@export_range(0.0, 500.0, 1.0, "suffix:m/s/s") var move_acceleration: float = 12.0

## How much friction is reduced when going against the wish direction of the player.
@export_range(0.0, 1.0, 0.05, "suffix:×") var move_friction_multiplier: float = 0.75

@export_group("Sprinting", "sprint_")

## How fast the player can _move while sprinting.
@export_range(0.0, 100.0, 0.05, "suffix:m/s") var sprint_speed: float = 4.0

## How quickly the player accelerates while sprinting.
@export_range(0.0, 500.0, 1.0, "suffix:m/s/s") var sprint_acceleration: float = 20.0

var input_vector: Vector2 = Vector2.ZERO
var wish_direction: Vector3 = Vector3.ZERO
var sprinting: bool = false

@onready var head: Node3D = $head
@onready var collision_shape: CollisionShape3D = $collision_shape
@onready var footstep_controller: FootstepController = $footstep_controller
@onready var camera: Camera3D = $head/camera
@onready var aim_controller: AimController = $aim_controller
@onready var start_target: Marker3D = %player_start_target
@onready var standing_head_height: float = head.position.y


func _ready() -> void:
	reset()


func _unhandled_input(event: InputEvent) -> void:
	if not active:
		return

	if (event is InputEventJoypadButton or event is InputEventJoypadMotion) and event.device != InputMethod.active_joypad_id:
		return

	if event.is_action_pressed(&"run"):
		sprinting = true
		return

	if event.is_action_released(&"run"):
		sprinting = false
		return

	_get_input_vector(event)


func _physics_process(_delta) -> void:
	if not active:
		input_vector = Vector2.ZERO
		wish_direction = Vector3.ZERO
		sprinting = false

	_update_physics()
	_move()


func deactivate() -> void:
	active = false


func activate() -> void:
	active = true


func reset() -> void:
	position = start_target.position
	rotation.y = start_target.rotation.y
	head.rotation.x = start_target.rotation.x
	footstep_controller.reset()


## Returns the forward direction of the player.
func get_forward_direction() -> Vector3:
	return -basis.z


## Returns the looking direction of the player.
func get_looking_direction() -> Vector3:
	return -head.global_basis.z


## Returns the vertical velocity of the player.
func get_vertical_velocity() -> Vector3:
	return Vector3(0.0, velocity.y, 0.0)


## Returns the horizontal velocity of the player.
func get_horizontal_velocity() -> Vector3:
	return Vector3(velocity.x, 0.0, velocity.z)


## Returns the speed of the player.
func get_speed() -> float:
	return velocity.length()


## Returns the horizontal speed of the player.
func get_horizontal_speed() -> float:
	return Vector2(velocity.x, velocity.z).length()


## Returns the direction of the velocity of the player.
func get_direction_of_velocity() -> Vector3:
	return velocity.normalized()


## Returns the direction of the horizontal velocity of the player.
func get_direction_of_horizontal_velocity() -> Vector3:
	return get_horizontal_velocity().normalized()


## Returns the player's center of mass.
func get_center_of_mass() -> Vector3:
	return collision_shape.global_position


func _get_input_vector(event: InputEvent) -> void:
	if InputMethod.active_input_method == InputMethod.ACTIVE_INPUT_KEYBOARD_AND_MOUSE:
		if not event is InputEventKey:
			return

		# I didn't want to use Input.get_vector(...),
		# because when opposing movement keys are pressed at the same time,
		# it treats it as if the player hasn't pressed anything at all
		#
		# What usually is happening when opposing movement keys are pressed at the same time,
		# is that the player is switching between either key rapidly
		#
		# This happens a lot in fast-paced games
		# But when opposing movement keys cancel each other out,
		# it makes the player stand still in the small amount of time
		# between pushing the new key, and releasing the old key
		#
		# This is the opposite of what the player wants: to keep moving
		#
		# To fix this, I wrote it so that new inputs overwrite the previous ones,
		# instead of canceling them out
		# Then when the new input is released, it'll go back to the old input if it's still pressed,
		# and only if it isn't, will it go to 0
		#
		# -Jeliciousz

		if event.is_action_pressed(&"move_forward"):
			input_vector.y = -1.0
		elif event.is_action_released(&"move_forward"):
			input_vector.y = 1.0 if Input.is_action_pressed(&"move_back") else 0.0
		elif event.is_action_pressed(&"move_back"):
			input_vector.y = 1.0
		elif event.is_action_released(&"move_back"):
			input_vector.y = -1.0 if Input.is_action_pressed(&"move_forward") else 0.0
		elif event.is_action_pressed(&"move_left"):
			input_vector.x = -1.0
		elif event.is_action_released(&"move_left"):
			input_vector.x = 1.0 if Input.is_action_pressed(&"move_right") else 0.0
		elif event.is_action_pressed(&"move_right"):
			input_vector.x = 1.0
		elif event.is_action_released(&"move_right"):
			input_vector.x = -1.0 if Input.is_action_pressed(&"move_left") else 0.0

		wish_direction = Vector3(input_vector.x, 0.0, input_vector.y).normalized()
	else:
		if not event is InputEventJoypadMotion:
			return

		input_vector = Input.get_vector(&"move_left", &"move_right", &"move_forward", &"move_back")
		wish_direction = Vector3(input_vector.x, 0.0, input_vector.y)


func _update_physics() -> void:
	var top_speed: float
	var acceleration: float

	if sprinting:
		top_speed = sprint_speed
		acceleration = sprint_acceleration
	else:
		top_speed = move_speed
		acceleration = move_acceleration

	_add_resistence()

	if active:
		_add_movement(top_speed, acceleration)


func _add_resistence() -> void:
	velocity = velocity.move_toward(Vector3.ZERO, physics_resistence * get_speed() * get_physics_process_delta_time())


func _add_movement(speed: float, acceleration: float) -> void:
	# This seemingly overcomplicated movement code is the result of trying to achieve
	# movement that doesn't feel clunky or finnicky, and has good control,
	# while still limiting the horizontal speed that the player can reach on their own
	#
	# If it just checked if the player was slower than the top speed
	# then added to player's velocity if they were,
	# then the player would have no control once they reached top speed,
	# because any movement inputs would be ignored
	# (also, the player's speed could be slightly off from top speed)
	#
	# The player would have to slow down to start moving in a different direction
	#
	# If it didn't ignore movement inputs, but instead, added to the player's velocity,
	# then just limited the speed to the top speed,
	# the player WOULD be able to control their movement at top speed,
	# but they WOULDN'T be able to ever go past that speed.
	#
	# External forces would be capped to the player's top speed,
	# the player wouldn't be able to increase their speed by jumping, etc.
	#
	# What I did was make it so that if the player's new speed after applying
	# the movement acceleration was faster than their than their old speed, and faster than top speed,
	# it would limit it in two ways:
	#
	# If the player's old speed before applying the movement acceleration
	# was SLOWER than the top speed, then it would limit their speed to the top speed
	# But, if the player's old speed was already FASTER than the top speed,
	# it would limit it to just the old speed
	#
	# Notice that it doesn't just reset the velocity to what it was
	# before applying the movement acceleration, it LIMITS it to the same speed,
	# because the player isn't just moving in the same direction that they're already going.
	# If the player moves perpendicular to the direction they're already going,
	# it will change the direction of their velocity, while keeping the same speed
	#
	# -Jeliciousz

	var old_horizontal_speed: float = get_horizontal_speed()
	velocity += basis * wish_direction * acceleration * get_physics_process_delta_time()
	var new_horizontal_speed: float = get_horizontal_speed()

	if new_horizontal_speed <= old_horizontal_speed:
		return

	if new_horizontal_speed <= speed:
		return

	var limited_velocity: Vector3

	if old_horizontal_speed <= speed:
		limited_velocity = get_horizontal_velocity().limit_length(speed)
	else:
		limited_velocity = get_horizontal_velocity().limit_length(old_horizontal_speed)

	velocity.x = limited_velocity.x
	velocity.z = limited_velocity.z


func _move() -> void:
	move_and_slide()
	apply_floor_snap()

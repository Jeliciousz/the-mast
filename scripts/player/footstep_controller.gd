class_name FootstepController
extends Node
## Handle footstepping

@export var player: Player

## How much the head can go down when stepping
@export var step_descent: float = 0.125

## How long a footstep takes
@export var step_duration: float = 0.25

## The minimum distance the last step must be from the player
@export var step_min_distance: float = 0.07

## The maximum distance the last step can be from the player
@export var step_max_distance: float = 0.7

## How far the footstep will be from the player (proportional to velocity)
@export var stepping_distance: float = 0.25

## How quickly the head will move up and down
@export var head_move_speed: float = 25.0

@export var footsteps_concrete_stream: AudioStream

var _last_step_time: float = 0.0
var _last_step_position := Vector3.ZERO
var _steps_taken: int = 0


func _physics_process(delta: float) -> void:
	var squared_step_distance := _last_step_position.distance_squared_to(player.global_position)
	var target_head_y := player.standing_head_height - step_descent * squared_step_distance
	player.head.position.y = move_toward(
			player.head.position.y,
			target_head_y,
			head_move_speed * delta
	)

	if GlobalTime.get_time() - _last_step_time < step_duration:
		return

	var step_distance = _last_step_position.distance_to(player.global_position)

	if step_distance > clampf(
			stepping_distance * player.velocity.length(),
			step_min_distance,
			step_max_distance
	):
		var new_step_distance := (stepping_distance * player.velocity).limit_length(step_max_distance)
		_last_step_position = player.global_position + new_step_distance
		_last_step_time = GlobalTime.get_time()

		var lr_foot_position := player.basis.x * (-0.1 + _steps_taken % 2 * 0.2)
		var volume_db := lerpf(
				-43.0,
				-36.0,
				clampf(0.15 * player.velocity.length_squared(), 0.0, 1.0)
		)
		SoundEffectsManager.spawn_sound_effect_3d(
				footsteps_concrete_stream,
				_last_step_position + lr_foot_position,
				volume_db,
				&"Player"
		)

		_steps_taken += 1


func reset() -> void:
	_last_step_position = player.global_position
	_last_step_time = GlobalTime.get_time()
	_steps_taken = 0

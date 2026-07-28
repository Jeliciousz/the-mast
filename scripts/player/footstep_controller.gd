class_name FootstepController extends Node


@export var player: Player

## How much the head can go down when stepping
@export var step_descent: float = 0.25

## How long a footstep takes
@export var step_duration: float = 0.25

## The minimum distance the last step must be from the player
@export var step_min_distance: float = 0.07

## The maximum distance the last step can be from the player
@export var step_max_distance: float = 0.7

## How much the player's velocity influences the perceived distance from the last footstep
@export var velocity_influence_on_distance: float = 0.1

## How much the player's velocity influences the step distance
@export var velocity_influence_on_step: float = 0.3

## How quickly the head will move up and down
@export var head_move_speed: float = 25.0


@export var footsteps_concrete_stream: AudioStream

var _last_step_time: float = 0.0
var _last_step_position := Vector3.ZERO
var _steps_taken: int = 0


func _physics_process(delta: float) -> void:
    player.head.position.y += ((player.standing_head_height - step_descent * _last_step_position.distance_squared_to(player.global_position)) - player.head.position.y) * head_move_speed * delta

    if GlobalTime.get_time() - _last_step_time < step_duration:
        return

    var distance_from_step = _last_step_position.distance_to(player.global_position + player.velocity * velocity_influence_on_distance)

    if distance_from_step > clampf(velocity_influence_on_step * player.velocity.length(), step_min_distance, step_max_distance):
        _last_step_position = player.global_position + (velocity_influence_on_step * player.velocity).limit_length(step_max_distance)
        _last_step_time = GlobalTime.get_time()
        
        var lr_foot_position := player.basis.x * (-0.1 + _steps_taken % 2 * 0.2)
        var volume_db := lerpf(-43.0, -36.0, clampf(0.15 * player.velocity.length_squared(), 0.0, 1.0))
        
        SoundEffectsManager.spawn_sound_effect_3d(footsteps_concrete_stream, _last_step_position + lr_foot_position, volume_db, &"Player")
        
        _steps_taken += 1


func reset() -> void:
    _last_step_position = player.global_position
    _last_step_time = GlobalTime.get_time()
    _steps_taken = 0

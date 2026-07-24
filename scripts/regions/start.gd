extends Node3D


var pod_scene = preload("res://scenes/regions/pod.scn")

@onready var player: Player = %player
@onready var cinematic_camera: Camera3D = $cinematic_camera
@onready var fade_rect: ColorRect = $fade_rect


func _ready() -> void:
    Events.exit_to_main_menu_pressed.connect(_exit_to_main_menu)

    Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

    if SceneTransition.in_transition:
        await SceneTransition.transition_wait_finished
    
    _start_opening_cinematic()


func _exit_to_main_menu() -> void:
    PauseManager.unpause_game()
    PauseManager.disable_pausing()

    player.deactivate()
    Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

    SceneTransition.start_transition(1.0, 0.5, 1.0)

    await SceneTransition.transition_fully_faded
    
    get_tree().change_scene_to_packed(pod_scene)


func _start_opening_cinematic(_x = null) -> void:
    var fov_tween = create_tween()
    fov_tween.set_trans(Tween.TRANS_SINE)
    fov_tween.tween_property(cinematic_camera, "fov", 94.0, 4.0)

    var fade_tween = create_tween()
    fade_tween.tween_property(fade_rect, "color", Color(0.0, 0.0, 0.0, 0.0), 10.0)

    var camera_tween = create_tween()
    camera_tween.set_trans(Tween.TRANS_SINE)
    camera_tween.tween_interval(5.0)
    camera_tween.tween_property(cinematic_camera, "rotation_degrees", Vector3(65.0, -90.0, 0.0), 8.0)
    camera_tween.tween_interval(1.0)
    camera_tween.tween_property(cinematic_camera, "global_transform", player.head.global_transform, 4.0)
    camera_tween.tween_callback(_opening_cinematic_finished)


func _opening_cinematic_finished() -> void:
    cinematic_camera.current = false
    player.camera.current = true

    player.activate()
    PauseManager.enable_pausing()
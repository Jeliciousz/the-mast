extends Node3D


@onready var player: Player = %player
@onready var cinematic_camera: Camera3D = $cinematic_camera
@onready var fade_rect: ColorRect = $fade_rect
@onready var pause_menu_ui: PauseMenuUI = $pause_menu_ui


func _ready() -> void:
    Events.main_menu_button_pressed.connect(_on_main_menu_pressed)

    if SceneTransition.in_transition:
        await SceneTransition.transition_wait_finished
    
    Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

    _start_opening_cinematic()


func _on_main_menu_pressed() -> void:
    pause_menu_ui.process_mode = Node.PROCESS_MODE_DISABLED

    player.deactivate()

    SceneTransition.start_transition(1.0, 0.5, 1.0)

    await SceneTransition.transition_fully_faded

    var pod_scene: PackedScene = load("res://scenes/regions/pod.tscn")

    get_tree().change_scene_to_packed(pod_scene)


func _start_opening_cinematic() -> void:
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

    await camera_tween.finished

    cinematic_camera.current = false
    player.camera.current = true

    pause_menu_ui.process_mode = Node.PROCESS_MODE_INHERIT

    if get_window().has_focus():
        player.activate()
    else:
        pause_menu_ui.pause()

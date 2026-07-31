extends Node3D


var camera_fly_tween: Tween

@onready var player: Player = %player
@onready var menu_view_target: Marker3D = $menu_view_target
@onready var menu_camera: Camera3D = $menu_camera
@onready var pause_menu_ui: PauseMenuUI = $pause_menu_ui


func _ready() -> void:
    Events.play_button_pressed.connect(_on_play_game_pressed)
    Events.main_menu_button_pressed.connect(_on_main_menu_pressed)


func _on_play_game_pressed() -> void:
    if camera_fly_tween:
        camera_fly_tween.kill()

    var pan_duration = 6.0 * clampf(menu_camera.global_position.distance_to(player.head.global_position) / 2.10759902000427, 0.0, 1.0)

    camera_fly_tween = create_tween()
    camera_fly_tween.tween_property(menu_camera, "global_transform", player.head.global_transform, pan_duration).set_trans(Tween.TRANS_CUBIC)

    await camera_fly_tween.finished

    menu_camera.current = false
    player.camera.current = true

    pause_menu_ui.process_mode = Node.PROCESS_MODE_INHERIT

    if get_window().has_focus():
        player.activate()
    else:
        pause_menu_ui.pause()


func _on_main_menu_pressed() -> void:
    pause_menu_ui.process_mode = Node.PROCESS_MODE_DISABLED
    player.deactivate()
    menu_camera.global_transform = player.head.global_transform

    player.camera.current = false
    menu_camera.current = true

    if camera_fly_tween:
        camera_fly_tween.kill()

    var pan_duration = 4.0 * clampf(menu_camera.global_position.distance_to(menu_view_target.global_position) / 2.10759902000427, 0.0, 1.0)

    camera_fly_tween = create_tween()
    camera_fly_tween.tween_property(menu_camera, "global_transform", menu_view_target.global_transform, pan_duration).set_trans(Tween.TRANS_CUBIC)


func _on_continue_tag_interacted() -> void:
    pause_menu_ui.process_mode = Node.PROCESS_MODE_DISABLED

    player.deactivate()

    SceneTransition.start_transition(2.0, 2.0, 0.0)

    await SceneTransition.transition_fully_faded

    var start_scene: PackedScene = load("res://scenes/regions/start.tscn")

    get_tree().change_scene_to_packed(start_scene)

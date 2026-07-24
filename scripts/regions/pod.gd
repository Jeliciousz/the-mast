extends Node3D


var menu_tween: Tween

@onready var main_menu_ui: MainMenuUI = $main_menu_ui
@onready var menu_view_target: Marker3D = $menu_view_target
@onready var menu_camera: Camera3D = $menu_camera
@onready var player: Player = %player


func _ready() -> void:
    Events.play_game_pressed.connect(_begin_game_start_sequence)
    Events.exit_to_main_menu_pressed.connect(_exit_to_main_menu)

    if SceneTransition.in_transition:
        main_menu_ui.ignore_input()

        await SceneTransition.transition_wait_finished
        
        main_menu_ui.restore_input()


func _begin_game_start_sequence() -> void:
    if menu_tween:
        menu_tween.kill()

    Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

    var menu_fadeout_tween = create_tween()
    menu_fadeout_tween.tween_callback(main_menu_ui.ignore_input)
    menu_fadeout_tween.tween_property(main_menu_ui, "modulate", Color(1, 1, 1, 0), 1.0)
    menu_fadeout_tween.tween_callback(main_menu_ui.disable)
    menu_fadeout_tween.stop()

    var pan_duration = 6.0 * clampf(menu_camera.global_position.distance_to(player.head.global_position) / 2.10759902000427, 0.0, 1.0)

    menu_tween = create_tween()
    menu_tween.tween_subtween(menu_fadeout_tween)
    menu_tween.parallel().tween_property(menu_camera, "global_transform", player.head.global_transform, pan_duration).set_trans(Tween.TRANS_CUBIC)
    menu_tween.tween_callback(_start_game)


func _start_game() -> void:
    menu_camera.current = false
    player.camera.current = true

    PauseManager.enable_pausing()

    if get_window().has_focus():
        player.activate()
    else:
        PauseManager.pause_game()


func _exit_to_main_menu() -> void:
    menu_camera.global_transform = player.head.global_transform

    PauseManager.unpause_game()
    PauseManager.disable_pausing()

    player.deactivate()
    Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

    player.camera.current = false
    menu_camera.current = true

    if menu_tween:
        menu_tween.kill()

    var menu_fadein_tween = create_tween()
    menu_fadein_tween.tween_callback(main_menu_ui.enable)
    menu_fadein_tween.tween_property(main_menu_ui, "modulate", Color(1, 1, 1, 1), 1.0)
    menu_fadein_tween.tween_callback(main_menu_ui.restore_input)
    menu_fadein_tween.stop()

    var pan_duration = 4.0 * clampf(menu_camera.global_position.distance_to(menu_view_target.global_position) / 2.10759902000427, 0.0, 1.0)

    menu_tween = create_tween()
    menu_tween.tween_subtween(menu_fadein_tween)
    menu_tween.parallel().tween_property(menu_camera, "global_transform", menu_view_target.global_transform, pan_duration).set_trans(Tween.TRANS_CUBIC)


func _on_continue_game_tag_interacted() -> void:
    player.deactivate()
    PauseManager.disable_pausing()

    SceneTransition.start_transition(2.0, 2.0, 0.0)

    await SceneTransition.transition_fully_faded

    get_tree().change_scene_to_packed(load("res://scenes/regions/start.scn"))

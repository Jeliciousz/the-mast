class_name MainMenuUI extends Control


var fade_tween: Tween

@onready var menu_options_main: VBoxContainer = $menu_options_main
@onready var menu_options_options: VBoxContainer = $menu_options_options
@onready var menu_options_quit: VBoxContainer = $menu_options_quit


func _ready() -> void:
    Events.play_game_pressed.connect(_on_play_game_pressed)
    Events.main_menu_pressed.connect(_on_main_menu_pressed)

    if SceneTransition.in_transition:
        mouse_behavior_recursive = Control.MOUSE_BEHAVIOR_DISABLED

        await SceneTransition.transition_wait_finished
        
        mouse_behavior_recursive = Control.MOUSE_BEHAVIOR_INHERITED
    
    Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func _on_play_game_pressed() -> void:
    mouse_behavior_recursive = Control.MOUSE_BEHAVIOR_DISABLED
    Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

    if fade_tween:
        fade_tween.kill()

    fade_tween = create_tween()
    fade_tween.tween_property(self, "modulate", Color(1, 1, 1, 0), 1.0)

    await fade_tween.finished

    process_mode = Node.PROCESS_MODE_DISABLED
    hide()


func _on_main_menu_pressed() -> void:
    process_mode = Node.PROCESS_MODE_INHERIT
    show()
    Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

    if fade_tween:
        fade_tween.kill()

    fade_tween = create_tween()
    fade_tween.tween_property(self, "modulate", Color(1, 1, 1, 1), 1.0)

    await fade_tween.finished

    mouse_behavior_recursive = Control.MOUSE_BEHAVIOR_INHERITED


# Menu options: Main

func _on_play_button_pressed() -> void:
    Events.play_game_pressed.emit()


func _on_options_button_pressed() -> void:
    menu_options_main.hide()
    menu_options_options.show()


func _on_quit_button_pressed() -> void:
    menu_options_main.hide()
    menu_options_quit.show()


# Menu options: Options

func _on_options_back_button_pressed() -> void:
    menu_options_options.hide()
    menu_options_main.show()


# Menu options: Quit

func _on_quit_confirm_button_pressed() -> void:
    Events.quit_game_pressed.emit()


func _on_quit_deny_button_pressed() -> void:
    menu_options_quit.hide()
    menu_options_main.show()

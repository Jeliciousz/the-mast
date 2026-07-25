class_name PauseMenuUI extends Control


@onready var menu_options_main: VBoxContainer = $menu_options_main
@onready var menu_options_options: VBoxContainer = $menu_options_options
@onready var menu_options_mm: VBoxContainer = $menu_options_mm
@onready var menu_options_quit: VBoxContainer = $menu_options_quit


func _notification(what: int) -> void:
    match what:
        NOTIFICATION_APPLICATION_FOCUS_OUT:
            if not PauseManager.is_paused():
                pause()


func _unhandled_input(event: InputEvent) -> void:
    if event.is_action_pressed(&"ui_close_dialog"):
        if PauseManager.is_paused():
            unpause()
        else:
            pause()


func pause() -> void:
    PauseManager.pause()
    show()
    Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func unpause() -> void:
    PauseManager.unpause()
    hide()
    Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


# Menu options: Main

func _on_continue_button_pressed() -> void:
    unpause()


func _on_options_button_pressed() -> void:
    menu_options_main.hide()
    menu_options_options.show()


func _on_main_menu_button_pressed() -> void:
    menu_options_main.hide()
    menu_options_mm.show()


func _on_quit_button_pressed() -> void:
    menu_options_main.hide()
    menu_options_quit.show()


# Menu options: Options

func _on_options_back_button_pressed() -> void:
    menu_options_options.hide()
    menu_options_main.show()


# Menu options: Main Menu

func _on_mm_confirm_button_pressed() -> void:
    menu_options_mm.hide()
    menu_options_main.show()

    unpause()

    Events.exit_to_main_menu_pressed.emit()


func _on_mm_deny_button_pressed() -> void:
    menu_options_mm.hide()
    menu_options_main.show()


func _on_quit_confirm_button_pressed() -> void:
    menu_options_quit.hide()
    menu_options_main.show()

    unpause()

    Events.quit_game_pressed.emit()


func _on_quit_deny_button_pressed() -> void:
    menu_options_quit.hide()
    menu_options_main.show()

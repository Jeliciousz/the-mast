extends VBoxContainer


func _ready() -> void:
    Events.exit_to_main_menu_pressed.connect(_exit_to_main_menu_pressed)


func _exit_to_main_menu_pressed() -> void:
    hide_all_menu_items()
    $"play_button".show()
    $"options_button".show()
    $"quit_button".show()


func _on_play_button_pressed() -> void:
    Events.play_game_pressed.emit()


func _on_options_button_pressed() -> void:
    hide_all_menu_items()
    $"options_back_button".show()


func _on_quit_button_pressed() -> void:
    hide_all_menu_items()
    $"confirmation_label".show()
    $"quit_confirm_button".show()
    $"quit_deny_button".show()


func _on_options_back_button_pressed() -> void:
    hide_all_menu_items()
    $"play_button".show()
    $"options_button".show()
    $"quit_button".show()


func _on_quit_confirm_button_pressed() -> void:
    Events.quit_game_pressed.emit()


func _on_quit_deny_button_pressed() -> void:
    hide_all_menu_items()
    $"play_button".show()
    $"options_button".show()
    $"quit_button".show()


func hide_all_menu_items() -> void:
    for menu_item in get_children():
        menu_item.hide()
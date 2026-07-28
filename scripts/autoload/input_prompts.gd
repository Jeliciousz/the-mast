extends Node


const INPUT_PROMPT_XBOX_BUTTON_PATHS: Dictionary[JoyButton, String] = {
    JoyButton.JOY_BUTTON_A: "res://assets/textures/input_prompts/xbox/xbox_button_a.png",
    JoyButton.JOY_BUTTON_B: "res://assets/textures/input_prompts/xbox/xbox_button_b.png",
    JoyButton.JOY_BUTTON_BACK: "res://assets/textures/input_prompts/xbox/xbox_button_view.png",
    JoyButton.JOY_BUTTON_DPAD_DOWN: "res://assets/textures/input_prompts/xbox/xbox_dpad_down_outline.png",
    JoyButton.JOY_BUTTON_DPAD_LEFT: "res://assets/textures/input_prompts/xbox/xbox_dpad_left_outline.png",
    JoyButton.JOY_BUTTON_DPAD_RIGHT: "res://assets/textures/input_prompts/xbox/xbox_dpad_right_outline.png",
    JoyButton.JOY_BUTTON_DPAD_UP: "res://assets/textures/input_prompts/xbox/xbox_dpad_up_outline.png",
    JoyButton.JOY_BUTTON_GUIDE: "res://assets/textures/input_prompts/xbox/xbox_guide.png",
    JoyButton.JOY_BUTTON_LEFT_SHOULDER: "res://assets/textures/input_prompts/xbox/xbox_lb.png",
    JoyButton.JOY_BUTTON_LEFT_STICK: "res://assets/textures/input_prompts/xbox/xbox_stick_side_l.png",
    JoyButton.JOY_BUTTON_MISC1: "res://assets/textures/input_prompts/xbox/xbox_button_share.png",
    JoyButton.JOY_BUTTON_PADDLE1: "res://assets/textures/input_prompts/xbox/xbox_elite_paddle_top_right.png",
    JoyButton.JOY_BUTTON_PADDLE2: "res://assets/textures/input_prompts/xbox/xbox_elite_paddle_bottom_right.png",
    JoyButton.JOY_BUTTON_PADDLE3: "res://assets/textures/input_prompts/xbox/xbox_elite_paddle_top_left.png",
    JoyButton.JOY_BUTTON_PADDLE4: "res://assets/textures/input_prompts/xbox/xbox_elite_paddle_bottom_left.png",
    JoyButton.JOY_BUTTON_RIGHT_SHOULDER: "res://assets/textures/input_prompts/xbox/xbox_rb.png",
    JoyButton.JOY_BUTTON_RIGHT_STICK: "res://assets/textures/input_prompts/xbox/xbox_stick_side_r.png",
    JoyButton.JOY_BUTTON_START: "res://assets/textures/input_prompts/xbox/xbox_button_menu.png",
    JoyButton.JOY_BUTTON_X: "res://assets/textures/input_prompts/xbox/xbox_button_x.png",
    JoyButton.JOY_BUTTON_Y: "res://assets/textures/input_prompts/xbox/xbox_button_y.png",
}


const INPUT_PROMPT_XBOX_BUTTON_STRINGS: Dictionary[JoyButton, String] = {
    JoyButton.JOY_BUTTON_A: "A",
    JoyButton.JOY_BUTTON_B: "B",
    JoyButton.JOY_BUTTON_BACK: "View",
    JoyButton.JOY_BUTTON_DPAD_DOWN: "Dpad Down",
    JoyButton.JOY_BUTTON_DPAD_LEFT: "Dpad Left",
    JoyButton.JOY_BUTTON_DPAD_RIGHT: "Dpad Right",
    JoyButton.JOY_BUTTON_DPAD_UP: "Dpad Up",
    JoyButton.JOY_BUTTON_GUIDE: "XBOX",
    JoyButton.JOY_BUTTON_LEFT_SHOULDER: "LB",
    JoyButton.JOY_BUTTON_LEFT_STICK: "LS",
    JoyButton.JOY_BUTTON_MISC1: "Share",
    JoyButton.JOY_BUTTON_PADDLE1: "P1",
    JoyButton.JOY_BUTTON_PADDLE2: "P2",
    JoyButton.JOY_BUTTON_PADDLE3: "P3",
    JoyButton.JOY_BUTTON_PADDLE4: "P4",
    JoyButton.JOY_BUTTON_RIGHT_SHOULDER: "RB",
    JoyButton.JOY_BUTTON_RIGHT_STICK: "RS",
    JoyButton.JOY_BUTTON_START: "Menu",
    JoyButton.JOY_BUTTON_X: "X",
    JoyButton.JOY_BUTTON_Y: "Y",
}


const INPUT_PROMPT_XBOX_MOTION_PATHS: Dictionary[JoyAxis, String] = {
    JoyAxis.JOY_AXIS_LEFT_X: "res://assets/textures/input_prompts/xbox/xbox_stick_top_l.png",
    JoyAxis.JOY_AXIS_LEFT_Y: "res://assets/textures/input_prompts/xbox/xbox_stick_top_l.png",
    JoyAxis.JOY_AXIS_RIGHT_X: "res://assets/textures/input_prompts/xbox/xbox_stick_top_r.png",
    JoyAxis.JOY_AXIS_RIGHT_Y: "res://assets/textures/input_prompts/xbox/xbox_stick_top_r.png",
    JoyAxis.JOY_AXIS_TRIGGER_LEFT: "res://assets/textures/input_prompts/xbox/xbox_lt.png",
    JoyAxis.JOY_AXIS_TRIGGER_RIGHT: "res://assets/textures/input_prompts/xbox/xbox_rt.png",
}


const INPUT_PROMPT_XBOX_MOTION_STRINGS: Dictionary[JoyAxis, String] = {
    JoyAxis.JOY_AXIS_LEFT_X: "Left Stick",
    JoyAxis.JOY_AXIS_LEFT_Y: "Left Stick",
    JoyAxis.JOY_AXIS_RIGHT_X: "Right Stick",
    JoyAxis.JOY_AXIS_RIGHT_Y: "Right Stick",
    JoyAxis.JOY_AXIS_TRIGGER_LEFT: "Left Trigger",
    JoyAxis.JOY_AXIS_TRIGGER_RIGHT: "Right Trigger",
}


const INPUT_PROMPT_XBOX360_BUTTON_PATHS: Dictionary[JoyButton, String] = {
    JoyButton.JOY_BUTTON_A: "res://assets/textures/input_prompts/xbox/xbox_button_a.png",
    JoyButton.JOY_BUTTON_B: "res://assets/textures/input_prompts/xbox/xbox_button_b.png",
    JoyButton.JOY_BUTTON_BACK: "res://assets/textures/input_prompts/xbox/xbox_button_back_icon.png",
    JoyButton.JOY_BUTTON_DPAD_DOWN: "res://assets/textures/input_prompts/xbox/xbox_dpad_down_outline.png",
    JoyButton.JOY_BUTTON_DPAD_LEFT: "res://assets/textures/input_prompts/xbox/xbox_dpad_left_outline.png",
    JoyButton.JOY_BUTTON_DPAD_RIGHT: "res://assets/textures/input_prompts/xbox/xbox_dpad_right_outline.png",
    JoyButton.JOY_BUTTON_DPAD_UP: "res://assets/textures/input_prompts/xbox/xbox_dpad_up_outline.png",
    JoyButton.JOY_BUTTON_GUIDE: "res://assets/textures/input_prompts/xbox/xbox_guide.png",
    JoyButton.JOY_BUTTON_LEFT_SHOULDER: "res://assets/textures/input_prompts/xbox/xbox_lb.png",
    JoyButton.JOY_BUTTON_LEFT_STICK: "res://assets/textures/input_prompts/xbox/xbox_stick_side_l.png",
    JoyButton.JOY_BUTTON_RIGHT_SHOULDER: "res://assets/textures/input_prompts/xbox/xbox_rb.png",
    JoyButton.JOY_BUTTON_RIGHT_STICK: "res://assets/textures/input_prompts/xbox/xbox_stick_side_r.png",
    JoyButton.JOY_BUTTON_START: "res://assets/textures/input_prompts/xbox/xbox_button_start_icon.png",
    JoyButton.JOY_BUTTON_X: "res://assets/textures/input_prompts/xbox/xbox_button_x.png",
    JoyButton.JOY_BUTTON_Y: "res://assets/textures/input_prompts/xbox/xbox_button_y.png",
}


const INPUT_PROMPT_XBOX360_BUTTON_STRINGS: Dictionary[JoyButton, String] = {
    JoyButton.JOY_BUTTON_A: "A",
    JoyButton.JOY_BUTTON_B: "B",
    JoyButton.JOY_BUTTON_BACK: "Back",
    JoyButton.JOY_BUTTON_DPAD_DOWN: "Dpad Down",
    JoyButton.JOY_BUTTON_DPAD_LEFT: "Dpad Left",
    JoyButton.JOY_BUTTON_DPAD_RIGHT: "Dpad Right",
    JoyButton.JOY_BUTTON_DPAD_UP: "Dpad Up",
    JoyButton.JOY_BUTTON_GUIDE: "XBOX",
    JoyButton.JOY_BUTTON_LEFT_SHOULDER: "LB",
    JoyButton.JOY_BUTTON_LEFT_STICK: "LS",
    JoyButton.JOY_BUTTON_RIGHT_SHOULDER: "RB",
    JoyButton.JOY_BUTTON_RIGHT_STICK: "RS",
    JoyButton.JOY_BUTTON_START: "Start",
    JoyButton.JOY_BUTTON_X: "X",
    JoyButton.JOY_BUTTON_Y: "Y",
}


const INPUT_PROMPT_XBOX360_MOTION_PATHS: Dictionary[JoyAxis, String] = {
    JoyAxis.JOY_AXIS_LEFT_X: "res://assets/textures/input_prompts/xbox/xbox_stick_top_l.png",
    JoyAxis.JOY_AXIS_LEFT_Y: "res://assets/textures/input_prompts/xbox/xbox_stick_top_l.png",
    JoyAxis.JOY_AXIS_RIGHT_X: "res://assets/textures/input_prompts/xbox/xbox_stick_top_r.png",
    JoyAxis.JOY_AXIS_RIGHT_Y: "res://assets/textures/input_prompts/xbox/xbox_stick_top_r.png",
    JoyAxis.JOY_AXIS_TRIGGER_LEFT: "res://assets/textures/input_prompts/xbox/xbox_lt.png",
    JoyAxis.JOY_AXIS_TRIGGER_RIGHT: "res://assets/textures/input_prompts/xbox/xbox_rt.png",
}


const INPUT_PROMPT_XBOX360_MOTION_STRINGS: Dictionary[JoyAxis, String] = {
    JoyAxis.JOY_AXIS_LEFT_X: "Left Stick",
    JoyAxis.JOY_AXIS_LEFT_Y: "Left Stick",
    JoyAxis.JOY_AXIS_RIGHT_X: "Right Stick",
    JoyAxis.JOY_AXIS_RIGHT_Y: "Right Stick",
    JoyAxis.JOY_AXIS_TRIGGER_LEFT: "Left Trigger",
    JoyAxis.JOY_AXIS_TRIGGER_RIGHT: "Right Trigger",
}


const INPUT_PROMPT_WIN_KEY_PATHS: Dictionary[Key, StringName] = {
    Key.KEY_0: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_0.png",
    Key.KEY_1: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_1.png",
    Key.KEY_2: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_2.png",
    Key.KEY_3: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_3.png",
    Key.KEY_4: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_4.png",
    Key.KEY_5: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_5.png",
    Key.KEY_6: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_6.png",
    Key.KEY_7: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_7.png",
    Key.KEY_8: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_8.png",
    Key.KEY_9: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_9.png",
    Key.KEY_A: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_a.png",
    Key.KEY_ALT: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_alt.png",
    Key.KEY_APOSTROPHE: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_apostrophe.png",
    Key.KEY_ASCIICIRCUM: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_caret.png",
    Key.KEY_ASCIITILDE: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_tilde.png",
    Key.KEY_ASTERISK: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_tilde.png",
    Key.KEY_B: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_b.png",
    Key.KEY_BACKSLASH: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_slash_back.png",
    Key.KEY_BACKSPACE: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_backspace_icon.png",
    Key.KEY_BRACKETLEFT: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_bracket_open.png",
    Key.KEY_BRACKETRIGHT: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_bracket_close.png",
    Key.KEY_C: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_c.png",
    Key.KEY_CAPSLOCK: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_capslock_icon.png",
    Key.KEY_COLON: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_colon.png",
    Key.KEY_COMMA: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_comma.png",
    Key.KEY_CTRL: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_ctrl.png",
    Key.KEY_D: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_d.png",
    Key.KEY_DELETE: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_delete.png",
    Key.KEY_DOWN: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_arrow_down.png",
    Key.KEY_E: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_e.png",
    Key.KEY_END: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_end.png",
    Key.KEY_ENTER: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_return.png",
    Key.KEY_EQUAL: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_equals.png",
    Key.KEY_ESCAPE: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_escape.png",
    Key.KEY_EXCLAM: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_exclamation.png",
    Key.KEY_F: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_f.png",
    Key.KEY_F1: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_f1.png",
    Key.KEY_F2: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_f2.png",
    Key.KEY_F3: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_f3.png",
    Key.KEY_F4: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_f4.png",
    Key.KEY_F5: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_f5.png",
    Key.KEY_F6: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_f6.png",
    Key.KEY_F7: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_f7.png",
    Key.KEY_F8: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_f8.png",
    Key.KEY_F9: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_f9.png",
    Key.KEY_F10: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_f10.png",
    Key.KEY_F11: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_f11.png",
    Key.KEY_F12: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_f12.png",
    Key.KEY_G: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_g.png",
    Key.KEY_GREATER: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_bracket_greater.png",
    Key.KEY_H: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_h.png",
    Key.KEY_HOME: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_home.png",
    Key.KEY_I: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_i.png",
    Key.KEY_INSERT: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_insert.png",
    Key.KEY_J: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_j.png",
    Key.KEY_K: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_k.png",
    Key.KEY_KP_0: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_0.png",
    Key.KEY_KP_1: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_1.png",
    Key.KEY_KP_2: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_2.png",
    Key.KEY_KP_3: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_3.png",
    Key.KEY_KP_4: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_4.png",
    Key.KEY_KP_5: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_5.png",
    Key.KEY_KP_6: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_6.png",
    Key.KEY_KP_7: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_7.png",
    Key.KEY_KP_8: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_8.png",
    Key.KEY_KP_9: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_9.png",
    Key.KEY_KP_ADD: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_numpad_plus.png",
    Key.KEY_KP_DIVIDE: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_slash_forward.png",
    Key.KEY_KP_ENTER: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_numpad_enter.png",
    Key.KEY_KP_MULTIPLY: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_asterisk.png",
    Key.KEY_KP_PERIOD: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_period.png",
    Key.KEY_KP_SUBTRACT: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_minus.png",
    Key.KEY_L: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_l.png",
    Key.KEY_LEFT: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_arrow_left.png",
    Key.KEY_LESS: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_bracket_less.png",
    Key.KEY_M: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_m.png",
    Key.KEY_META: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_win.png",
    Key.KEY_MINUS: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_minus.png",
    Key.KEY_N: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_n.png",
    Key.KEY_NUMLOCK: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_numlock.png",
    Key.KEY_O: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_o.png",
    Key.KEY_P: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_p.png",
    Key.KEY_PAGEDOWN: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_page_down.png",
    Key.KEY_PAGEUP: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_page_up.png",
    Key.KEY_PAUSE: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_pause.png",
    Key.KEY_PERIOD: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_period.png",
    Key.KEY_PLUS: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_plus.png",
    Key.KEY_PRINT: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_printscreen.png",
    Key.KEY_Q: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_q.png",
    Key.KEY_QUESTION: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_question.png",
    Key.KEY_QUOTEDBL: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_qoute.png",
    Key.KEY_QUOTELEFT: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_tilde.png",
    Key.KEY_R: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_r.png",
    Key.KEY_RIGHT: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_arrow_right.png",
    Key.KEY_S: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_s.png",
    Key.KEY_SCROLLLOCK: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_scroll_lock.png",
    Key.KEY_SEMICOLON: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_semicolon.png",
    Key.KEY_SHIFT: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_shift_icon.png",
    Key.KEY_SLASH: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_slash_forward.png",
    Key.KEY_SPACE: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_space.png",
    Key.KEY_T: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_t.png",
    Key.KEY_TAB: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_tab_icon.png",
    Key.KEY_U: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_u.png",
    Key.KEY_UNDERSCORE: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_underscore.png",
    Key.KEY_UP: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_arrow_up.png",
    Key.KEY_V: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_v.png",
    Key.KEY_W: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_w.png",
    Key.KEY_X: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_x.png",
    Key.KEY_Y: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_y.png",
    Key.KEY_Z: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_z.png",
}


const INPUT_PROMPT_MAC_KEY_PATHS: Dictionary[Key, StringName] = {
    Key.KEY_0: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_0.png",
    Key.KEY_1: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_1.png",
    Key.KEY_2: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_2.png",
    Key.KEY_3: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_3.png",
    Key.KEY_4: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_4.png",
    Key.KEY_5: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_5.png",
    Key.KEY_6: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_6.png",
    Key.KEY_7: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_7.png",
    Key.KEY_8: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_8.png",
    Key.KEY_9: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_9.png",
    Key.KEY_A: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_a.png",
    Key.KEY_ALT: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_option.png",
    Key.KEY_APOSTROPHE: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_apostrophe.png",
    Key.KEY_ASCIICIRCUM: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_caret.png",
    Key.KEY_ASCIITILDE: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_tilde.png",
    Key.KEY_ASTERISK: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_tilde.png",
    Key.KEY_B: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_b.png",
    Key.KEY_BACKSLASH: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_slash_back.png",
    Key.KEY_BACKSPACE: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_backspace_icon.png",
    Key.KEY_BRACKETLEFT: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_bracket_open.png",
    Key.KEY_BRACKETRIGHT: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_bracket_close.png",
    Key.KEY_C: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_c.png",
    Key.KEY_CAPSLOCK: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_capslock_icon.png",
    Key.KEY_COLON: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_colon.png",
    Key.KEY_COMMA: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_comma.png",
    Key.KEY_CTRL: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_ctrl.png",
    Key.KEY_D: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_d.png",
    Key.KEY_DELETE: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_delete.png",
    Key.KEY_DOWN: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_arrow_down.png",
    Key.KEY_E: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_e.png",
    Key.KEY_END: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_end.png",
    Key.KEY_ENTER: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_return.png",
    Key.KEY_EQUAL: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_equals.png",
    Key.KEY_ESCAPE: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_escape.png",
    Key.KEY_EXCLAM: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_exclamation.png",
    Key.KEY_F: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_f.png",
    Key.KEY_F1: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_f1.png",
    Key.KEY_F2: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_f2.png",
    Key.KEY_F3: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_f3.png",
    Key.KEY_F4: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_f4.png",
    Key.KEY_F5: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_f5.png",
    Key.KEY_F6: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_f6.png",
    Key.KEY_F7: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_f7.png",
    Key.KEY_F8: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_f8.png",
    Key.KEY_F9: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_f9.png",
    Key.KEY_F10: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_f10.png",
    Key.KEY_F11: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_f11.png",
    Key.KEY_F12: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_f12.png",
    Key.KEY_G: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_g.png",
    Key.KEY_GREATER: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_bracket_greater.png",
    Key.KEY_H: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_h.png",
    Key.KEY_HOME: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_home.png",
    Key.KEY_I: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_i.png",
    Key.KEY_INSERT: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_insert.png",
    Key.KEY_J: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_j.png",
    Key.KEY_K: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_k.png",
    Key.KEY_KP_0: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_0.png",
    Key.KEY_KP_1: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_1.png",
    Key.KEY_KP_2: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_2.png",
    Key.KEY_KP_3: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_3.png",
    Key.KEY_KP_4: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_4.png",
    Key.KEY_KP_5: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_5.png",
    Key.KEY_KP_6: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_6.png",
    Key.KEY_KP_7: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_7.png",
    Key.KEY_KP_8: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_8.png",
    Key.KEY_KP_9: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_9.png",
    Key.KEY_KP_ADD: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_numpad_plus.png",
    Key.KEY_KP_DIVIDE: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_slash_forward.png",
    Key.KEY_KP_ENTER: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_numpad_enter.png",
    Key.KEY_KP_MULTIPLY: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_asterisk.png",
    Key.KEY_KP_PERIOD: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_period.png",
    Key.KEY_KP_SUBTRACT: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_minus.png",
    Key.KEY_L: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_l.png",
    Key.KEY_LEFT: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_arrow_left.png",
    Key.KEY_LESS: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_bracket_less.png",
    Key.KEY_M: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_m.png",
    Key.KEY_META: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_command.png",
    Key.KEY_MINUS: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_minus.png",
    Key.KEY_N: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_n.png",
    Key.KEY_NUMLOCK: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_numlock.png",
    Key.KEY_O: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_o.png",
    Key.KEY_P: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_p.png",
    Key.KEY_PAGEDOWN: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_page_down.png",
    Key.KEY_PAGEUP: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_page_up.png",
    Key.KEY_PAUSE: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_pause.png",
    Key.KEY_PERIOD: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_period.png",
    Key.KEY_PLUS: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_plus.png",
    Key.KEY_PRINT: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_printscreen.png",
    Key.KEY_Q: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_q.png",
    Key.KEY_QUESTION: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_question.png",
    Key.KEY_QUOTEDBL: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_qoute.png",
    Key.KEY_QUOTELEFT: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_tilde.png",
    Key.KEY_R: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_r.png",
    Key.KEY_RIGHT: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_arrow_right.png",
    Key.KEY_S: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_s.png",
    Key.KEY_SCROLLLOCK: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_scroll_lock.png",
    Key.KEY_SEMICOLON: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_semicolon.png",
    Key.KEY_SHIFT: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_shift_icon.png",
    Key.KEY_SLASH: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_slash_forward.png",
    Key.KEY_SPACE: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_space.png",
    Key.KEY_T: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_t.png",
    Key.KEY_TAB: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_tab_icon.png",
    Key.KEY_U: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_u.png",
    Key.KEY_UNDERSCORE: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_underscore.png",
    Key.KEY_UP: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_arrow_up.png",
    Key.KEY_V: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_v.png",
    Key.KEY_W: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_w.png",
    Key.KEY_X: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_x.png",
    Key.KEY_Y: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_y.png",
    Key.KEY_Z: "res://assets/textures/input_prompts/keyboard_and_mouse/keyboard_z.png",
}


const INPUT_PROMPT_MOUSE_BUTTON_PATHS: Dictionary[MouseButton, String] = {
    MouseButton.MOUSE_BUTTON_LEFT: "res://assets/textures/input_prompts/keyboard_and_mouse/mouse_left.png",
    MouseButton.MOUSE_BUTTON_MIDDLE: "res://assets/textures/input_prompts/keyboard_and_mouse/mouse_scroll.png",
    MouseButton.MOUSE_BUTTON_RIGHT: "res://assets/textures/input_prompts/keyboard_and_mouse/mouse_right.png",
    MouseButton.MOUSE_BUTTON_WHEEL_DOWN: "res://assets/textures/input_prompts/keyboard_and_mouse/mouse_scroll_down.png",
    MouseButton.MOUSE_BUTTON_WHEEL_UP: "res://assets/textures/input_prompts/keyboard_and_mouse/mouse_scroll_up.png",
    MouseButton.MOUSE_BUTTON_XBUTTON1: "res://assets/textures/input_prompts/keyboard_and_mouse/mouse_side_forward.png",
    MouseButton.MOUSE_BUTTON_XBUTTON2: "res://assets/textures/input_prompts/keyboard_and_mouse/mouse_side_back.png",
}

const INPUT_PROMPT_MOUSE_BUTTON_STRINGS: Dictionary[MouseButton, String] = {
    MouseButton.MOUSE_BUTTON_LEFT: "Left Click",
    MouseButton.MOUSE_BUTTON_MIDDLE: "Middle Click",
    MouseButton.MOUSE_BUTTON_RIGHT: "Right Click",
    MouseButton.MOUSE_BUTTON_WHEEL_DOWN: "Scroll Down",
    MouseButton.MOUSE_BUTTON_WHEEL_UP: "Scroll Up",
    MouseButton.MOUSE_BUTTON_XBUTTON1: "Forward Mouse Button",
    MouseButton.MOUSE_BUTTON_XBUTTON2: "Backward Mouse Button",
}


func action_get_path(action: StringName) -> String:
    var event_type: int

    if Global.active_input_method == Global.ACTIVE_INPUT_KEYBOARD_MOUSE:
        event_type = Global.active_input_method
    elif Global.active_input_method == Global.ACTIVE_INPUT_XBOX:
        if _action_has_path(action):
            event_type = Global.active_input_method
        else:
            event_type = Global.ACTIVE_INPUT_KEYBOARD_MOUSE
    elif Global.active_input_method == Global.ACTIVE_INPUT_XBOX360:
        if _action_has_path(action):
            event_type = Global.active_input_method
        else:
            event_type = Global.ACTIVE_INPUT_KEYBOARD_MOUSE
    else:
        event_type = Global.ACTIVE_INPUT_KEYBOARD_MOUSE


    if event_type == Global.ACTIVE_INPUT_XBOX:
        var event = InputMap.action_get_events(action)[1]

        if event is InputEventJoypadButton:
            if INPUT_PROMPT_XBOX_BUTTON_PATHS.has(event.button_index):
                return INPUT_PROMPT_XBOX_BUTTON_PATHS.get(event.button_index)
        elif event is InputEventJoypadMotion:
            if INPUT_PROMPT_XBOX_MOTION_PATHS.has(event.button_index):
                return INPUT_PROMPT_XBOX_MOTION_PATHS.get(event.button_index)
    
    elif event_type == Global.ACTIVE_INPUT_XBOX360:
        var event = InputMap.action_get_events(action)[1]

        if event is InputEventJoypadButton:
            if INPUT_PROMPT_XBOX360_BUTTON_PATHS.has(event.button_index):
                return INPUT_PROMPT_XBOX360_BUTTON_PATHS.get(event.button_index)
        elif event is InputEventJoypadMotion:
            if INPUT_PROMPT_XBOX360_MOTION_PATHS.has(event.button_index):
                return INPUT_PROMPT_XBOX360_MOTION_PATHS.get(event.button_index)

    elif event_type == Global.ACTIVE_INPUT_KEYBOARD_MOUSE:
        var event = InputMap.action_get_events(action)[0]

        if event is InputEventKey:
            var key = event.physical_keycode if event.physical_keycode != 0 else event.keycode

            if INPUT_PROMPT_WIN_KEY_PATHS.has(key):
                return INPUT_PROMPT_WIN_KEY_PATHS.get(key)
        elif event is InputEventMouseButton:
            if INPUT_PROMPT_MOUSE_BUTTON_PATHS.has(event.button_index):
                return INPUT_PROMPT_MOUSE_BUTTON_PATHS.get(event.button_index)
    
    return ""


func action_get_string(action: StringName) -> String:
    var event_type: int

    if Global.active_input_method == Global.ACTIVE_INPUT_KEYBOARD_MOUSE:
        event_type = Global.active_input_method
    elif Global.active_input_method == Global.ACTIVE_INPUT_XBOX:
        if _action_has_path(action):
            event_type = Global.active_input_method
        else:
            event_type = Global.ACTIVE_INPUT_KEYBOARD_MOUSE
    elif Global.active_input_method == Global.ACTIVE_INPUT_XBOX360:
        if _action_has_path(action):
            event_type = Global.active_input_method
        else:
            event_type = Global.ACTIVE_INPUT_KEYBOARD_MOUSE
    else:
        event_type = Global.ACTIVE_INPUT_KEYBOARD_MOUSE
    

    if event_type == Global.ACTIVE_INPUT_XBOX:
        var event = InputMap.action_get_events(action)[1]

        if event is InputEventJoypadButton:
            if INPUT_PROMPT_XBOX_BUTTON_STRINGS.has(event.button_index):
                return INPUT_PROMPT_XBOX_BUTTON_STRINGS.get(event.button_index)
        elif event is InputEventJoypadMotion:
            if INPUT_PROMPT_XBOX_MOTION_STRINGS.has(event.button_index):
                return INPUT_PROMPT_XBOX_MOTION_STRINGS.get(event.button_index)
    
    elif event_type == Global.ACTIVE_INPUT_XBOX360:
        var event = InputMap.action_get_events(action)[1]

        if event is InputEventJoypadButton:
            if INPUT_PROMPT_XBOX360_BUTTON_STRINGS.has(event.button_index):
                return INPUT_PROMPT_XBOX360_BUTTON_STRINGS.get(event.button_index)
        elif event is InputEventJoypadMotion:
            if INPUT_PROMPT_XBOX360_MOTION_STRINGS.has(event.button_index):
                return INPUT_PROMPT_XBOX360_MOTION_STRINGS.get(event.button_index)

    elif event_type == Global.ACTIVE_INPUT_KEYBOARD_MOUSE:
        var event = InputMap.action_get_events(action)[0]

        if event is InputEventKey:
            var key = event.physical_keycode if event.physical_keycode != 0 else event.keycode

            return OS.get_keycode_string(key)
        elif event is InputEventMouseButton:
            return INPUT_PROMPT_MOUSE_BUTTON_STRINGS.get(event.button_index)
    
    return ""


func _action_has_path(action: StringName) -> bool:
    if Global.active_input_method == Global.ACTIVE_INPUT_XBOX:
        var event = InputMap.action_get_events(action)[1]

        if event is InputEventJoypadButton:
            return INPUT_PROMPT_XBOX_BUTTON_PATHS.has(event.button_index)
        elif event is InputEventJoypadMotion:
            return INPUT_PROMPT_XBOX_MOTION_PATHS.has(event.button_index)
    elif Global.active_input_method == Global.ACTIVE_INPUT_XBOX360:
        var event = InputMap.action_get_events(action)[1]

        if event is InputEventJoypadButton:
            return INPUT_PROMPT_XBOX360_BUTTON_PATHS.has(event.button_index)
        elif event is InputEventJoypadMotion:
            return INPUT_PROMPT_XBOX360_MOTION_PATHS.has(event.button_index)
    elif Global.active_input_method == Global.ACTIVE_INPUT_KEYBOARD_MOUSE:
        var event = InputMap.action_get_events(action)[0]

        if event is InputEventKey:
            return INPUT_PROMPT_WIN_KEY_PATHS.has(event.keycode)
        elif event is InputEventMouseButton:
            return INPUT_PROMPT_MOUSE_BUTTON_PATHS.has(event.button_index)
    
    return false
extends Node


const SETTING_RESOLUTION_270: int = 0
const SETTING_RESOLUTION_360: int = 1
const SETTING_RESOLUTION_720: int = 2
const SETTING_RESOLUTION_1080: int = 3
const SETTING_RESOLUTION_1440: int = 4

const SETTING_3D_SCALE_25: int = 0
const SETTING_3D_SCALE_50: int = 1
const SETTING_3D_SCALE_100: int = 2
const SETTING_3D_SCALE_150: int = 3
const SETTING_3D_SCALE_200: int = 4

const SETTING_FILTERING_NEAREST: int = 0
const SETTING_FILTERING_BILINEAR: int = 1
const SETTING_FILTERING_FSR: int = 2
const SETTING_FILTERING_FSR2: int = 3

const SETTING_ANTIALIASING_NONE: int = 0
const SETTING_ANTIALIASING_FXAA: int = 1
const SETTING_ANTIALIASING_SMAA: int = 2
const SETTING_ANTIALIASING_MSAA_2X: int = 3
const SETTING_ANTIALIASING_MSAA_4X: int = 4
const SETTING_ANTIALIASING_MSAA_8X: int = 5
const SETTING_ANTIALIASING_TAA: int = 6

const SETTING_VSYNC_DISABLED: int = 0
const SETTING_VSYNC_DEFAULT: int = 1
const SETTING_VSYNC_ADAPTIVE: int = 2
const SETTING_VSYNC_MAILBOX: int = 3


signal setting_changed(setting_name: StringName, new_value: Variant)


var _settings: Dictionary[StringName, Variant] = {
    &"player_look_sensitivity": 1.0,
    
    &"viewport_resolution": SETTING_RESOLUTION_360,
    &"viewport_3d_scale": SETTING_3D_SCALE_50,
    &"viewport_filtering": SETTING_FILTERING_NEAREST,
    &"viewport_antialiasing": SETTING_ANTIALIASING_NONE,
    &"window_43_aspect": true,
    &"vsync": false,
    &"max_fps": 60,
    &"show_fps": false,

    &"volume_master": 1.0,
    &"volume_music": 1.0,
    &"volume_ui": 1.0,
    &"volume_world": 1.0,
    &"volume_player": 1.0,

    &"ui_scale": 1.0
}


func _ready() -> void:
    setting_changed.connect(_on_setting_changed)


func set_setting(setting_name: StringName, new_value: Variant) -> void:
    if not _settings.has(setting_name):
        printerr("Setting " + setting_name + " not found!")
        return

    _settings.set(setting_name, new_value)
    setting_changed.emit(setting_name, new_value)


func setting_exists(setting_name: StringName) -> bool:
    return _settings.has(setting_name)


func get_setting(setting_name: StringName) -> Variant:
    if not _settings.has(setting_name):
        printerr("Setting " + setting_name + " not found!")
        return null
    
    return _settings.get(setting_name)


func _on_setting_changed(setting_name: StringName, new_value: Variant) -> void:
    match setting_name:
        &"viewport_resolution":
            match new_value:
                Settings.SETTING_RESOLUTION_270:
                    get_viewport().content_scale_size = Vector2i(360, 270)
                    Settings.set_setting(&"ui_scale", 0.75)
                Settings.SETTING_RESOLUTION_360:
                    get_viewport().content_scale_size = Vector2i(480, 360)
                    Settings.set_setting(&"ui_scale", 1.0)
                Settings.SETTING_RESOLUTION_720:
                    get_viewport().content_scale_size = Vector2i(960, 720)
                    Settings.set_setting(&"ui_scale", 2.0)
                Settings.SETTING_RESOLUTION_1080:
                    get_viewport().content_scale_size = Vector2i(1440, 1080)
                    Settings.set_setting(&"ui_scale", 3.0)
                Settings.SETTING_RESOLUTION_1440:
                    get_viewport().content_scale_size = Vector2i(1920, 1440)
                    Settings.set_setting(&"ui_scale", 4.0)
        &"viewport_3d_scale":
            match new_value:
                Settings.SETTING_3D_SCALE_25:
                    get_viewport().scaling_3d_scale = 0.25
                Settings.SETTING_3D_SCALE_50:
                    get_viewport().scaling_3d_scale = 0.5
                Settings.SETTING_3D_SCALE_100:
                    get_viewport().scaling_3d_scale = 1.0
                Settings.SETTING_3D_SCALE_150:
                    get_viewport().scaling_3d_scale = 1.5
                    Settings.set_setting(&"viewport_filtering", Settings.SETTING_FILTERING_BILINEAR)
                    Settings.set_setting(&"viewport_antialiasing", Settings.SETTING_ANTIALIASING_NONE)
                Settings.SETTING_3D_SCALE_200:
                    get_viewport().scaling_3d_scale = 2.0
                    Settings.set_setting(&"viewport_filtering", Settings.SETTING_FILTERING_BILINEAR)
                    Settings.set_setting(&"viewport_antialiasing", Settings.SETTING_ANTIALIASING_NONE)
        &"viewport_filtering":
            match new_value:
                Settings.SETTING_FILTERING_NEAREST:
                    get_viewport().scaling_3d_mode = Window.SCALING_3D_MODE_NEAREST
                Settings.SETTING_FILTERING_BILINEAR:
                    get_viewport().scaling_3d_mode = Window.SCALING_3D_MODE_BILINEAR
                Settings.SETTING_FILTERING_FSR:
                    get_viewport().scaling_3d_mode = Window.SCALING_3D_MODE_FSR
                Settings.SETTING_FILTERING_FSR2:
                    get_viewport().scaling_3d_mode = Window.SCALING_3D_MODE_FSR2
                    Settings.set_setting(&"viewport_antialiasing", Settings.SETTING_ANTIALIASING_NONE)
        &"viewport_antialiasing":
            match new_value:
                Settings.SETTING_ANTIALIASING_NONE:
                    get_viewport().msaa_2d = Viewport.MSAA_DISABLED
                    get_viewport().msaa_3d = Viewport.MSAA_DISABLED
                    get_viewport().screen_space_aa = Viewport.SCREEN_SPACE_AA_DISABLED
                    get_viewport().use_taa = false
                Settings.SETTING_ANTIALIASING_FXAA:
                    get_viewport().msaa_2d = Viewport.MSAA_DISABLED
                    get_viewport().msaa_3d = Viewport.MSAA_DISABLED
                    get_viewport().screen_space_aa = Viewport.SCREEN_SPACE_AA_FXAA
                    get_viewport().use_taa = false
                Settings.SETTING_ANTIALIASING_SMAA:
                    get_viewport().msaa_2d = Viewport.MSAA_DISABLED
                    get_viewport().msaa_3d = Viewport.MSAA_DISABLED
                    get_viewport().screen_space_aa = Viewport.SCREEN_SPACE_AA_SMAA
                    get_viewport().use_taa = false
                Settings.SETTING_ANTIALIASING_MSAA_2X:
                    get_viewport().msaa_2d = Viewport.MSAA_2X
                    get_viewport().msaa_3d = Viewport.MSAA_2X
                    get_viewport().screen_space_aa = Viewport.SCREEN_SPACE_AA_DISABLED
                    get_viewport().use_taa = false
                Settings.SETTING_ANTIALIASING_MSAA_4X:
                    get_viewport().msaa_2d = Viewport.MSAA_4X
                    get_viewport().msaa_3d = Viewport.MSAA_4X
                    get_viewport().screen_space_aa = Viewport.SCREEN_SPACE_AA_DISABLED
                    get_viewport().use_taa = false
                Settings.SETTING_ANTIALIASING_MSAA_8X:
                    get_viewport().msaa_2d = Viewport.MSAA_8X
                    get_viewport().msaa_3d = Viewport.MSAA_8X
                    get_viewport().screen_space_aa = Viewport.SCREEN_SPACE_AA_DISABLED
                    get_viewport().use_taa = false
                Settings.SETTING_ANTIALIASING_TAA:
                    get_viewport().msaa_2d = Viewport.MSAA_DISABLED
                    get_viewport().msaa_3d = Viewport.MSAA_DISABLED
                    get_viewport().screen_space_aa = Viewport.SCREEN_SPACE_AA_DISABLED
                    get_viewport().use_taa = true
        &"window_43_aspect":
            if new_value:
                get_window().content_scale_aspect = Window.CONTENT_SCALE_ASPECT_KEEP
            else:
                get_window().content_scale_aspect = Window.CONTENT_SCALE_ASPECT_EXPAND
        &"vsync":
            match new_value:
                Settings.SETTING_VSYNC_DISABLED:
                    DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
                Settings.SETTING_VSYNC_DEFAULT:
                    DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
                    Settings.set_setting(&"max_fps", 0)
                Settings.SETTING_VSYNC_ADAPTIVE:
                    DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ADAPTIVE)
                    Settings.set_setting(&"max_fps", 0)
                Settings.SETTING_VSYNC_MAILBOX:
                    DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_MAILBOX)
                    Settings.set_setting(&"max_fps", 0)
        &"max_fps":
            Engine.max_fps = new_value
        &"volume_master":
            var bus_index = AudioServer.get_bus_index(&"Master")
            AudioServer.set_bus_volume_linear(bus_index, new_value)
        &"volume_music":
            var bus_index = AudioServer.get_bus_index(&"Music")
            AudioServer.set_bus_volume_linear(bus_index, new_value)
        &"volume_ui":
            var bus_index = AudioServer.get_bus_index(&"UI")
            AudioServer.set_bus_volume_linear(bus_index, new_value)
        &"volume_world":
            var bus_index = AudioServer.get_bus_index(&"World")
            AudioServer.set_bus_volume_linear(bus_index, new_value)
        &"volume_player":
            var bus_index = AudioServer.get_bus_index(&"Player")
            AudioServer.set_bus_volume_linear(bus_index, new_value)
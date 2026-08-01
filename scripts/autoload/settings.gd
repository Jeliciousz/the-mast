extends Node
## Manages global settings

signal setting_changed(setting_name: StringName, new_value: Variant)

enum {
	RESOLUTION_270,
	RESOLUTION_360,
	RESOLUTION_720,
	RESOLUTION_1080,
	RESOLUTION_1440,
}

enum {
	SCALE_3D_25,
	SCALE_3D_50,
	SCALE_3D_100,
	SCALE_3D_150,
	SCALE_3D_200,
}

enum {
	FILTERING_NEAREST,
	FILTERING_BILINEAR,
	FILTERING_FSR,
	FILTERING_FSR2,
}

enum {
	ANTIALIASING_NONE,
	ANTIALIASING_FXAA,
	ANTIALIASING_SMAA,
	ANTIALIASING_MSAA_2X,
	ANTIALIASING_MSAA_4X,
	ANTIALIASING_MSAA_8X,
	ANTIALIASING_TAA,
}

enum {
	VSYNC_DISABLED,
	VSYNC_DEFAULT,
	VSYNC_ADAPTIVE,
	VSYNC_MAILBOX,
}

var _settings: Dictionary[StringName, Variant] = {
	&"look_sensitivity_mouse": 1.0,
	&"look_sensitivity": 2.0,
	&"viewport_resolution": RESOLUTION_360,
	&"viewport_3d_scale": SCALE_3D_50,
	&"viewport_filtering": FILTERING_NEAREST,
	&"viewport_antialiasing": ANTIALIASING_NONE,
	&"viewport_43_aspect": true,
	&"viewport_vsync": VSYNC_DISABLED,
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
				Settings.RESOLUTION_270:
					get_viewport().content_scale_size = Vector2i(360, 270)
					Settings.set_setting(&"ui_scale", 0.75)
				Settings.RESOLUTION_360:
					get_viewport().content_scale_size = Vector2i(480, 360)
					Settings.set_setting(&"ui_scale", 1.0)
				Settings.RESOLUTION_720:
					get_viewport().content_scale_size = Vector2i(960, 720)
					Settings.set_setting(&"ui_scale", 2.0)
				Settings.RESOLUTION_1080:
					get_viewport().content_scale_size = Vector2i(1440, 1080)
					Settings.set_setting(&"ui_scale", 3.0)
				Settings.RESOLUTION_1440:
					get_viewport().content_scale_size = Vector2i(1920, 1440)
					Settings.set_setting(&"ui_scale", 4.0)
		&"viewport_3d_scale":
			match new_value:
				Settings.SCALE_3D_25:
					get_viewport().scaling_3d_scale = 0.25
				Settings.SCALE_3D_50:
					get_viewport().scaling_3d_scale = 0.5
				Settings.SCALE_3D_100:
					get_viewport().scaling_3d_scale = 1.0
				Settings.SCALE_3D_150:
					get_viewport().scaling_3d_scale = 1.5
					Settings.set_setting(&"viewport_filtering", Settings.FILTERING_BILINEAR)
					Settings.set_setting(&"viewport_antialiasing", Settings.ANTIALIASING_NONE)
				Settings.SCALE_3D_200:
					get_viewport().scaling_3d_scale = 2.0
					Settings.set_setting(&"viewport_filtering", Settings.FILTERING_BILINEAR)
					Settings.set_setting(&"viewport_antialiasing", Settings.ANTIALIASING_NONE)
		&"viewport_filtering":
			match new_value:
				Settings.FILTERING_NEAREST:
					get_viewport().scaling_3d_mode = Window.SCALING_3D_MODE_NEAREST
				Settings.FILTERING_BILINEAR:
					get_viewport().scaling_3d_mode = Window.SCALING_3D_MODE_BILINEAR
				Settings.FILTERING_FSR:
					get_viewport().scaling_3d_mode = Window.SCALING_3D_MODE_FSR
				Settings.FILTERING_FSR2:
					get_viewport().scaling_3d_mode = Window.SCALING_3D_MODE_FSR2
					Settings.set_setting(&"viewport_antialiasing", Settings.ANTIALIASING_NONE)
		&"viewport_antialiasing":
			match new_value:
				Settings.ANTIALIASING_NONE:
					get_viewport().msaa_2d = Viewport.MSAA_DISABLED
					get_viewport().msaa_3d = Viewport.MSAA_DISABLED
					get_viewport().screen_space_aa = Viewport.SCREEN_SPACE_AA_DISABLED
					get_viewport().use_taa = false
				Settings.ANTIALIASING_FXAA:
					get_viewport().msaa_2d = Viewport.MSAA_DISABLED
					get_viewport().msaa_3d = Viewport.MSAA_DISABLED
					get_viewport().screen_space_aa = Viewport.SCREEN_SPACE_AA_FXAA
					get_viewport().use_taa = false
				Settings.ANTIALIASING_SMAA:
					get_viewport().msaa_2d = Viewport.MSAA_DISABLED
					get_viewport().msaa_3d = Viewport.MSAA_DISABLED
					get_viewport().screen_space_aa = Viewport.SCREEN_SPACE_AA_SMAA
					get_viewport().use_taa = false
				Settings.ANTIALIASING_MSAA_2X:
					get_viewport().msaa_2d = Viewport.MSAA_2X
					get_viewport().msaa_3d = Viewport.MSAA_2X
					get_viewport().screen_space_aa = Viewport.SCREEN_SPACE_AA_DISABLED
					get_viewport().use_taa = false
				Settings.ANTIALIASING_MSAA_4X:
					get_viewport().msaa_2d = Viewport.MSAA_4X
					get_viewport().msaa_3d = Viewport.MSAA_4X
					get_viewport().screen_space_aa = Viewport.SCREEN_SPACE_AA_DISABLED
					get_viewport().use_taa = false
				Settings.ANTIALIASING_MSAA_8X:
					get_viewport().msaa_2d = Viewport.MSAA_8X
					get_viewport().msaa_3d = Viewport.MSAA_8X
					get_viewport().screen_space_aa = Viewport.SCREEN_SPACE_AA_DISABLED
					get_viewport().use_taa = false
				Settings.ANTIALIASING_TAA:
					get_viewport().msaa_2d = Viewport.MSAA_DISABLED
					get_viewport().msaa_3d = Viewport.MSAA_DISABLED
					get_viewport().screen_space_aa = Viewport.SCREEN_SPACE_AA_DISABLED
					get_viewport().use_taa = true
		&"viewport_43_aspect":
			if new_value:
				get_window().content_scale_aspect = Window.CONTENT_SCALE_ASPECT_KEEP
			else:
				get_window().content_scale_aspect = Window.CONTENT_SCALE_ASPECT_EXPAND
		&"viewport_vsync":
			match new_value:
				Settings.VSYNC_DISABLED:
					DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
				Settings.VSYNC_DEFAULT:
					DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
					Settings.set_setting(&"max_fps", 0)
				Settings.VSYNC_ADAPTIVE:
					DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ADAPTIVE)
					Settings.set_setting(&"max_fps", 0)
				Settings.VSYNC_MAILBOX:
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

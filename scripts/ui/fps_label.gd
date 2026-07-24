extends Label


var format_string = "FPS: %d"

func _process(_delta) -> void:
    text = format_string % Engine.get_frames_per_second()
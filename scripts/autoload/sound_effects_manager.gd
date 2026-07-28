extends Node


func spawn_sound_effect(stream: AudioStream, volume_db: float = 0.0, bus: StringName = &"Master") -> void:
    var sound_effect: AudioStreamPlayer = AudioStreamPlayer.new()
    sound_effect.stream = stream
    sound_effect.volume_db = volume_db
    sound_effect.bus = bus

    add_child(sound_effect)

    sound_effect.play()
    
    await sound_effect.finished

    sound_effect.queue_free()


func spawn_sound_effect_3d(stream: AudioStream, position: Vector3, volume_db: float = 0.0, bus: StringName = &"Master") -> void:
    var sound_effect: AudioStreamPlayer3D = AudioStreamPlayer3D.new()
    sound_effect.stream = stream
    sound_effect.volume_db = volume_db
    sound_effect.bus = bus
    sound_effect.attenuation_model = AudioStreamPlayer3D.ATTENUATION_INVERSE_SQUARE_DISTANCE

    add_child(sound_effect)

    sound_effect.global_position = position
    sound_effect.play()
    
    await sound_effect.finished

    sound_effect.queue_free()
extends Label


@export var player: Player


var format_string = """position (x,y,z): %0.2f, %0.2f, %0.2f
direction (y,x): %0.2f, %0.2f
velocity (x,y,z): %0.2f, %0.2f, %0.2f"""


func _physics_process(_delta) -> void:
    text = format_string % [
        player.global_position.x, player.global_position.y, player.global_position.z,
        player.rotation_degrees.y, player.head.rotation_degrees.x,
        player.velocity.x, player.velocity.y, player.velocity.z,
    ]

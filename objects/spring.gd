extends StaticBody2D

@onready var area = $Area2D

@export var lock = false
@export var launch_power = 1000

func _on_area_2d_body_entered(player: Node2D) -> void:
	if !player is PoyoBody: return

	if lock:
		player.position = position
		player.velocity.x = 0

	player.velocity.y = -launch_power

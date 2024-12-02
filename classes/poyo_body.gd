extends CharacterBody2D
class_name PoyoBody

@export var sprung = false

func _process(delta: float) -> void:
	if is_on_floor():
		sprung = false

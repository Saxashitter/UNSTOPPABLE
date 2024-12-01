extends Node

@onready var animator:AnimatedSprite2D = get_parent().get_node("AnimatedSprite2D")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func get_dir():
	if animator.flip_h:
		return -1

	return 1

func set_dir(dir):
	if dir != 0:
		animator.flip_h = dir < 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var player = get_parent()
	var animation = "idle"

	if player.velocity.x != 0:
		animation = "walk"
		set_dir(player.velocity.x)

	if abs(player.velocity.x) >= 500:
		animation = "run"

	if !player.is_on_floor():
		animation = "jump"
		if player.velocity.y >= 0:
			animation = "fall"

	if animator.animation != animation:
		animator.play(animation)

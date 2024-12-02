extends PoyoBody

@export var get_dir = func():
	if $AnimatedSprite2D.flip_h:
		return -1

	return 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	var dir = get_dir.call()

	var found = $RayCast2D.get_collider()

	if found != null:
		$AnimatedSprite2D.flip_h = not $AnimatedSprite2D.flip_h
		dir *= -1
		$RayCast2D.target_position.x *= -1

	velocity.x = 40*dir

	move_and_slide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

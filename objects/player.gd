extends CharacterBody2D

var jumped = false

const SPEED = 320
const RUN_SPEED = 500
const ACCEL = 32
const DECEL = 15
const JUMP_VELOCITY = -400
const GRAVITY_CAP = 800


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		var gravity = get_gravity()

		if jumped:
			gravity *= 0.5

		velocity += gravity
		velocity.y = min(velocity.y, GRAVITY_CAP)

	if jumped:
		if Input.is_action_just_released("game_jump") or is_on_floor():
			#if velocity.y < 0:
			#	velocity.y *= 0.5
			jumped = false

	# Handle jump.
	if Input.is_action_just_pressed("game_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jumped = true

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("game_left", "game_right")
	var movespeed = SPEED

	if Input.is_action_pressed("game_run"):
		movespeed = RUN_SPEED

	var speed = move_toward(velocity.x, 0, DECEL)

	if direction != 0:
		speed = clamp(velocity.x+(ACCEL*direction), -movespeed, movespeed)

	velocity.x = speed

	move_and_slide()

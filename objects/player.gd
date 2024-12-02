extends PoyoBody

var jumped = false

const SPEED = 320
const RUN_SPEED = 500
const ACCEL = 32
const SKIDACCEL = 55
const DECEL = 24
const JUMP_VELOCITY = -200
const GRAVITY_MULT = 0.5
const GRAVITY_CAP = 800

@onready var animator = $Animator

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if !is_on_floor():
		var gravity = get_gravity()

		if jumped:
			gravity *= GRAVITY_MULT

		velocity += gravity
		velocity.y = min(velocity.y, GRAVITY_CAP)

	if jumped:
		if Input.is_action_just_released("game_jump") or is_on_floor():
			#if velocity.y < 0:
			#	velocity.y *= 0.5
			jumped = false

	# Handle jump.
	if Input.is_action_just_pressed("game_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY/GRAVITY_MULT
		jumped = true

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("game_left", "game_right")
	var movespeed = SPEED

	if Input.is_action_pressed("game_run"):
		movespeed = RUN_SPEED

	var speed = move_toward(velocity.x, 0, DECEL)

	if !is_on_floor():
		speed = move_toward(velocity.x, 0, DECEL*0.25)

	if direction != 0:
		var accel = ACCEL

		if animator.get_dir.call() != direction:
			accel = SKIDACCEL

		if !is_on_floor():
			accel *= 0.38

		speed = clamp(velocity.x+(accel*direction), -movespeed, movespeed)

	velocity.x = speed
	move_and_slide()

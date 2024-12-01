extends AnimatedSprite2D

@onready var p = get_parent()

func idle_anim():
	speed_scale = 1

func walk_anim():
	speed_scale = abs(p.velocity.x)/320

var anim_data = {
	"idle": idle_anim,
	"walk": walk_anim,
	"jump": idle_anim,
	"fall": idle_anim
}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !(anim_data.has(animation)): return

	anim_data[animation].call()

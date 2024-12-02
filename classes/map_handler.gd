extends StaticBody2D
class_name MapHandler

@export var music_name:String
@onready var player_spawn = Vector2(0, 0)

@export var music:AudioStreamPlayer = AudioStreamPlayer.new()

# Called when the node enters the scene tree for the first time.

func _enter_tree() -> void:
	music.set_stream(load("res://assets/music/"+music_name+".ogg"))
	add_child(music)

func _ready() -> void:
	if get_node_or_null("PlayerSpawn") != null:
		player_spawn = get_node("PlayerSpawn").position

	for child in get_children():
		if child is Polygon2D:
			var collider = CollisionPolygon2D.new()

			collider.position = child.position
			collider.scale = child.scale
			collider.polygon = child.polygon

			add_child(collider)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

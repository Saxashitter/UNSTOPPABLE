extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		if child is Polygon2D:
			var collider = CollisionPolygon2D.new()
			collider.polygon = child.polygon
			call_deferred("add_child", collider)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

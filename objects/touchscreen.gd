extends Node
class_name TouchScreenLayout

func _ready() -> void:
	if not OsHandler.mobile:
		for child in get_children():
			remove_child(child)

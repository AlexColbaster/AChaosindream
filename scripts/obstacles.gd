extends Node2D

func _ready():
	position.y = -INF

func get_rnd():
	var child = get_child(randi()%get_child_count())
	var child_dubl = child.duplicate()
	return child_dubl

extends StaticBody2D

onready var player := $"../player"

func _process(delta):
	position.x = player.position.x

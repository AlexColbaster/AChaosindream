extends Sprite

#onready var checkpoint:Sprite = owner.get_node("checkpoint")

func _process(delta):
	if get_parent().position.x < 100000:
		position.x = 1000
		scale.x = 1
	else:
		position.x = -1000
		scale.x = -1
	#rect_position = Vector2(clamp(direction.x, 0, limit.x), clamp(direction.y, 0, limit.y))
	

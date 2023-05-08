extends TileMap

#var mine_time := 0.0
#var cell := Vector2()
#onready var mine_animation := get_parent().get_node("mine")
#
#func _process(delta):
#	var mouse:Vector2 = get_global_mouse_position()
#	var new_cell:Vector2 = world_to_map(mouse)
#	if new_cell != cell:
#		mine_animation.set_cellv(cell, -1)
#		cell = new_cell
#		mine_time = 0
#	if Input.is_action_pressed("m1"):
#		set_cellv(cell, 0)
#	elif Input.is_action_pressed("m0") && get_cellv(cell) != -1:
#		mine_time += delta
#		mine_animation.set_cellv(cell, int(mine_time*7))
#		if mine_time > 0.2:
#			mine_animation.set_cellv(cell, -1)
#			mine_time = 0
#			set_cellv(cell, -1)

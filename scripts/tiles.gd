extends TileMap

onready var player := $"../player"
var with_obst = []
onready var bg1 = randi()%8
onready var bg2 = randi()%4
var chaos := false

func _process(delta):
	if name == "bg2":
		position.x = -int(player.global_position.x * 0.2) % 512
	var near_cell:Vector2 = world_to_map(player.global_position)
	
	for x in range(near_cell.x - 5, near_cell.x + 5):
		for y in range(near_cell.y - 5, near_cell.y + 5):
			var cell := Vector2(x, y)
			var tile
			if name == "bg1":
				tile = bg1
			else:
				if !chaos:
					tile = bg2
				else:
					tile = randi()%4
			if get_cellv(cell) != tile:
				set_cellv(cell, tile)
				if name == "bg1" && !(cell.x in with_obst) && int(cell.x) % 2:
					var obst:Node2D = Obstacles.get_rnd()
					add_child(obst)
					obst.position = Vector2(map_to_world(cell).x, map_to_world(near_cell).y + 1048)
					with_obst += [cell.x]

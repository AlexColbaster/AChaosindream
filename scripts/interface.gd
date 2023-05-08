extends CanvasLayer

var old_pos := 0.0
var tween = Tween.new()
onready var bg1 = owner.owner.get_node("bg1")
onready var bg2 = owner.owner.get_node("bg2")

func _ready():
	add_child(tween)

func _process(delta):
	if old_pos != owner.position.x && owner.position.x - old_pos > 0:
		Main.distance += owner.position.x - old_pos
		old_pos = owner.position.x
	$distance.text = "distance: "+str(int(Main.distance) / 100)+"       time: "+str(int(Main.time))
	
	if int(Main.distance) / 100 > Main.target_dist && Main.current_level < 4:
		Main.distance = 0
		tween.interpolate_property($panel, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 0.2)
		tween.start()
		yield(get_tree().create_timer(0.2), "timeout")
		tween.interpolate_property($panel, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 0.2)
		tween.start()
		match Main.current_level:
			0:
				owner.camera_speed = 0.2
				$waves.visible = true
				bg1.bg1 = randi()%8
				bg2.bg2 = randi()%4
			1:
				owner.camera_speed = 0.3
				$waves.visible = false
				$invert.visible = true
				bg1.bg1 = randi()%8
				bg2.bg2 = randi()%4
			2:
				owner.camera_speed = 0.4
				$invert.visible = false
				$"waves+invert".visible = true
				bg1.bg1 = randi()%8
				bg2.bg2 = randi()%4
			3:
				owner.camera_speed = 0.5
				bg2.chaos = true
		Main.current_level += 1


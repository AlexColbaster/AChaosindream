extends Node

var current_level := 0
var distance := 0.0
var target_dist := 500.0
var time := 0.0

func _process(delta):
	time += delta

func _ready():
	randomize()

func reparent(child: Node, new_parent: Node):
	var old_parent = child.get_parent()
	old_parent.remove_child(child)
	new_parent.add_child(child)

func anim(player:AnimationPlayer, animation:String, speed:int, inverse := false):
	var current := player.current_animation
	if current != animation && !(current in animation) && !(animation in current) && current != "Start":
		if !inverse:
			player.play(animation)
		else:
			player.play_backwards(animation)
		player.playback_speed = speed

func tween_loop(tween:Tween, tween_values:Array, obj:Object, parameter:String, duration:float):
	if !(tween in get_children()):
		add_child(tween)
	else:
		tween.disconnect("tween_all_completed", self, "_on_tween_loop_completed")
	tween.connect("tween_all_completed", self, "_on_tween_loop_completed", [tween, tween_values, obj, parameter, duration])
	tween.interpolate_property(obj, parameter, tween_values[0], tween_values[1], duration)
	tween.start()

func _on_tween_loop_completed(tween:Tween, tween_values:Array, obj:Object, parameter:String, duration:float):
	tween_values.invert()
	tween.interpolate_property(obj, parameter, tween_values[0], tween_values[1], duration)
	tween.start()

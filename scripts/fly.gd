extends Node2D

var tween1 := Tween.new()
var tween_values1 := [0, -200000]
var tween2 := Tween.new()
var tween_values2 := [Vector2(), Vector2(-1000000, 0)]

func _ready():
	Main.tween_loop(tween1, tween_values1, get_child(0), "rotation_degrees", 1000)
	Main.tween_loop(tween2, tween_values2, get_child(0), "position", 1000)



extends RigidBody2D

var jump_time := 0.0
var slide_time := 0.0
onready var body := $player
var speed := 2500
var scale_ := 0.5
onready var animation := $player/animation
onready var col := $col
var camera_speed := 0.0

func _physics_process(delta):
	if body.scale.x > 0:
		$camera.rotation_degrees += camera_speed
	else:
		$camera.rotation_degrees -= camera_speed
	run(delta)
	var on_floor := test_motion(Vector2(body.scale.x, 0.1))
	if on_floor:
		jump()
		slide()
	else:
		if Input.is_key_pressed(KEY_W):
			Main.anim(animation, "Jump", 5)
	jump_time += delta
	slide_time += delta

func run(delta):
	if Input.is_key_pressed(KEY_A) && Input.is_key_pressed(KEY_D):
		linear_velocity.x = 0
	elif Input.is_key_pressed(KEY_A):
		linear_velocity.x = -speed
		body.scale = Vector2(-scale_, scale_)
	elif Input.is_key_pressed(KEY_D):
		linear_velocity.x = speed
		body.scale = Vector2(scale_, scale_)
	else:
		linear_velocity.x = 0
	if animation.current_animation != "Slide":
		slide_time += delta
		col.scale.y = 1
		col.position.y = 150
		if animation.current_animation != "Jump":
			if linear_velocity.x:
				Main.anim(animation, "Run", 7)
			else:
				Main.anim(animation, "Idle", 1)

func jump():
	if Input.is_key_pressed(KEY_W) && linear_velocity.y > -100 && animation.current_animation != "Slide":
		if jump_time > 0.2:
			jump_time = 0
			apply_central_impulse(Vector2(0, -200))

func slide():
	if Input.is_key_pressed(KEY_S) && slide_time > 1.0 && animation.current_animation != "Jump":
		col.scale.y = 0.2
		col.position.y = 250
		Main.anim(animation, "Slide", 1)
		slide_time = 0



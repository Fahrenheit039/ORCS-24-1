extends KinematicBody2D

var max_speed = 400
var speed = 0
var acceleration = 1000
var move_direction = Vector2(0,0)
onready var _animated_sprite = $AnimatedSprite

func _physics_process(delta):
	MovementLoop(delta)

func _process(_delta):
	AnimationLoop()
		
func MovementLoop(delta):
	move_direction.x = int(Input.is_action_pressed("Right")) - int(Input.is_action_pressed("Left"))
	move_direction.y = ( int(Input.is_action_pressed("Down")) - int(Input.is_action_pressed("Up")) ) / float(2)
	if move_direction == Vector2(0,0):
		speed = 0
	else:
		speed += acceleration * delta
		if speed > max_speed:
			speed = max_speed
		var motion = move_direction.normalized() * max_speed # speed
		move_and_slide(motion)

func AnimationLoop():
	var anim_direction = "S"
	var anim_mode = "Idle"
	var animation
	match move_direction:
		Vector2(-1,0):
			anim_direction = "W"
		Vector2(1,0):
			anim_direction = "E"
		Vector2(0,0.5):
			anim_direction = "S"
		Vector2(0,-0.5):
			anim_direction = "N"
		Vector2(-1,-0.5):
			anim_direction = "NW"
		Vector2(-1,0.5):
			anim_direction = "SW"
		Vector2(1,-0.5):
			anim_direction = "NE"
		Vector2(1,0.5):
			anim_direction = "SE"
		
	if move_direction != Vector2(0,0):
		anim_mode = "Walk"
	else:
		anim_mode = "Idle"
	animation = anim_mode + "_" + anim_direction
	get_node("AnimatedSprite").play(animation)

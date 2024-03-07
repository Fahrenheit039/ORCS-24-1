extends KinematicBody

class_name Player

const speed = 10
var gravity:Vector3 = Vector3.DOWN * 12
var velocity : Vector3 = Vector3.ZERO

func _ready():
	add_to_group("player")

func _physics_process(delta):
	velocity += gravity*delta
	get_input()
	move_and_slide(velocity, Vector3.UP)

func get_input():
	var vy = velocity.y
	velocity = Vector3.ZERO
	if Input.is_action_pressed("move_forward"):
		velocity += Vector3.FORWARD * speed
	if Input.is_action_pressed("move_back"):
		velocity += Vector3.BACK * speed
	if Input.is_action_pressed("strafe_left"):
		velocity += Vector3.LEFT * speed
	if Input.is_action_pressed("strafe_right"):
		velocity += Vector3.RIGHT * speed
	
	

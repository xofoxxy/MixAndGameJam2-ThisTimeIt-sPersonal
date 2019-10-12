extends KinematicBody
onready var camYZ = get_node("Cam_YZ")
onready var camXY = get_node("Cam_XY")
onready var camXZ = get_node("Cam_XZ")
var currentCam : int = 1
var currentLayout : int = 1
var dir = Vector3()
const gravity  = Vector3(0,-.1,0)
const acc = 4.5
const deacc = 16
const maxSlope = 40
var direction = Vector3()
var movement = Vector3()
var velocity = 50
var maxMovementSpeed = 1
var acceleration = 1
var friction = 0

# 1 is cam XY
# 2 is cam XZ
# 3 is cam YZ
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _physics_process(delta):
	movement = movement.normalized()
	if movement != Vector3(0,0,0):
		movement = lerp(movement,direction*velocity,acceleration)
	else:
		movement = lerp(movement,Vector3(0,0,0),friction)
	movement.y = movement.y - 20
	move_and_slide(movement)
	direction = Vector3(0,0,0)
	pass
func _input(event):
	if event.is_action_pressed("DimensionShift"):
		print("Current Cam is: " + str(currentCam))
		match currentCam:
			1:
				camXY.make_current()
				print("dimension XY")
				currentLayout = 1
			2:
				camXZ.make_current()
				print("dimension XZ")
				currentLayout = 2
			3:
				camYZ.make_current()
				print("dimension YZ")
				currentLayout = 3
		currentCam = currentCam + 1
		if currentCam > 3:
			currentCam = 1
	match (currentLayout):
		1:
			if Input.is_action_pressed("Up"):
				direction.z -= 1
			if Input.is_action_pressed("Down"):
				direction.z += 1
			if Input.is_action_pressed("Left"):
				direction.x += -1
			if Input.is_action_pressed("Right"):
				direction.x += 1
		2:
			if Input.is_action_pressed("Up"):
				direction.y = 3
			if Input.is_action_pressed("Left"):
				direction.x += -1
			if Input.is_action_pressed("Right"):
				direction.x += 1
			pass
		3:
			if Input.is_action_pressed("Up"):
				direction.y += 3
			if Input.is_action_pressed("Left"):
				direction.z += 1
			if Input.is_action_pressed("Right"):
				direction.z += -1
			pass
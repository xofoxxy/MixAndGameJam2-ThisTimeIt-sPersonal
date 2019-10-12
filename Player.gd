extends KinematicBody
onready var camYZ = get_node("Cam_YZ")
onready var camXY = get_node("Cam_XY")
onready var camXZ = get_node("Cam_XZ")
var currentCam : int = 1

var x = 1 # these are bools
var y = 1
var z = 0



# 1 is cam XY
# 2 is cam XZ
# 3 is cam YZ
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	camXY.make_current()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_and_collide(Vector3(1,0,0))

func _input(event):
	if event.is_action_pressed("DimensionShift"):
		currentCam = currentCam + 1
		print("Current Cam is: " + str(currentCam))
		match currentCam:
			2:
				camXZ.make_current()
				print("dimension XZ")
				x = 1
				z = 1
				y = 0
			3:
				camYZ.make_current()
				print("dimension YZ")
				x = 0
				y = 1
				z = 1
			4:
				currentCam = 1
				camXY.make_current()
				print("dimension XY")
				x = 1
				y = 1
				z = 0
				
	if event.is_action_pressed("Down"):
		move_and_collide(Vector3(1,0,0))



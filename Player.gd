extends KinematicBody
onready var cam1 = get_node("Camera")
onready var cam2 = get_node("Camera2")
onready var cam3 = get_node("Camera3")
var currentCam : int = 1
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if event.is_action_pressed("DimensionShift"):
		currentCam = currentCam + 1
		match currentCam:
			2:
				cam2.make_current()
			3:
				cam3.make_current()
			4:
				currentCam = 1
				cam1.make_current()



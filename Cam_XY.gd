extends Camera
onready var Towards = $Towards
onready var Away = $Away
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	Towards.add_exception(get_node("."))
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	checkDistanceInFront()
func checkDistanceInFront():
	if Towards.is_colliding():
		Towards.transform -= 1
	else:
		pass
	pass
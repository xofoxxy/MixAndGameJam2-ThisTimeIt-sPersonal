extends AudioStreamPlayer
onready var global = get_node("/root/globalVariables")


func _finished():
	play(0.0)
	pass

func _on_Button2_pressed():
	if global.Sound == true:
		play(0)
	else:
		stop()
	pass # Replace with function body.

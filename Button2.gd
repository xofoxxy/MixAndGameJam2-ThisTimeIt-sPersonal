extends Button
onready var offIcon = load("res://ButtonSoundOff.png")
onready var onIcon = load("res://ButtonSound.png")
onready var global = get_node("/root/globalVariables")
func _toggled(button_pressed):
	if global.Sound == true:
		set_button_icon(offIcon)
		global.Sound = false
	else:
		set_button_icon(onIcon)
		global.Sound = true
extends "res://screens/basic_screen.gd"

func _ready():
	#$Animator.play("YOUWON")
	$Button.connect("button_up", self, "on_try_again")
	
func on_try_again():
	global.reset()
	change_scene()

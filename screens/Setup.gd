extends "res://screens/basic_screen.gd"

signal progress_finished

func _on_Setup_transition_finished():
	print("animation progress finished")
	change_scene()

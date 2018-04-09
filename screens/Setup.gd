extends "res://screens/basic_screen.gd"

signal progress_finished

func _on_Setup_transition_finished():
	print("animation progress finished")
	change_scene()

func change_scene(to = next_scene):
	# speed up the process. 
	# TODO: Needs some understanding 
	get_tree().change_scene(to)

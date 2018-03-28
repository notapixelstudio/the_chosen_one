extends Node

signal change_aspect(button)
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var button 

func _ready():
	for button in get_children():
		button.connect("pressed", get_parent(), "on_pressed", [button])
	# Called every time the node is added to the scene.
	# Initialization here

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func on_pressed(button):
	print(button.text)
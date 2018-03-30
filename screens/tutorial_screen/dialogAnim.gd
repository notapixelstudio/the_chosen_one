extends "res://screens/basic_screen.gd"
var tutor_part = 1
signal dialog_ended

func _ready():
	connect("dialog_ended", get_node("/root/Arena/FSMControl/Transitions/EnemyFinished"), "_on_dialog_ended")
	connect("dialog_ended", get_node("/root/Arena/FSMControl/Transitions/PlayerEnd"), "_on_dialog_ended")
	connect("dialog_ended", get_node("/root/Arena/FSMControl/Transitions/UselessAction"), "_on_dialog_ended")	

func _on_next_up():
	emit_signal("dialog_ended")
			
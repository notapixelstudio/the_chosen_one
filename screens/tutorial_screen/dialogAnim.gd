extends "res://screens/basic_screen.gd"
var tutor_part = 0
signal dialog_ended

func _ready():
	connect("dialog_ended", get_node("/root/Arena/FSMControl/Transitions/EnemyFinished"), "_on_dialog_ended")
	connect("dialog_ended", get_node("/root/Arena/FSMControl/Transitions/PlayerEnd"), "_on_dialog_ended")
	connect("dialog_ended", get_node("/root/Arena/FSMControl/Transitions/UselessAction"), "_on_dialog_ended")
	$Animator.play($Animator.get_animation_list()[tutor_part])

func _on_next_up():
	if $Animator.is_playing():
		$Animator.seek($Animator.get_current_animation_length(), true)
	else:
		$Animator.play("dialog")
		$Animator.seek(0.0, true)
		print("signal")
		emit_signal("dialog_ended")
			
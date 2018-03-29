extends "res://screens/basic_screen.gd"
var tutor_part = 1
signal dialog_ended

func _ready():
	connect("dialog_ended", get_node("/root/Arena/FSMControl/Transitions/EnemyFinished"), "_on_dialog_ended")
	connect("dialog_ended", get_node("/root/Arena/FSMControl/Transitions/PlayerEnd"), "_on_dialog_ended")
	

func _on_next_up():
	if $Animator.is_playing():
		$Animator.seek($Animator.get_current_animation_length())
	else:
		if tutor_part < $Animator.get_animation_list().size() -1:
			tutor_part += 1
			$Animator.play($Animator.get_animation_list()[tutor_part])
		else:
			#$Dialogue/Button.disabled = true
			emit_signal("dialog_ended")
			
extends "res://addons/net.kivano.fsm/content/FSMState.gd";
################################### R E A D M E ##################################
# For more informations check script attached to FSM node
#
#

##################################################################################
#####  Variables (Constants, Export Variables, Node Vars, Normal variables)  #####
######################### var myvar setget myvar_set,myvar_get ###################

var dialog_box

##################################################################################
#########                       Getters and Setters                      #########
##################################################################################
#you will want to use those
func getFSM(): return fsm; #defined in parent class
func getLogicRoot(): return logicRoot; #defined in parent class 

##################################################################################
#########                 Implement those below ancestor                 #########
##################################################################################
#you can transmit parameters if fsm is initialized manually
func stateInit(inParam1=null,inParam2=null,inParam3=null,inParam4=null, inParam5=null): 
	dialog_box = $DialogScene
	logicRoot.current_turn = 0
	global.dragon_script.update_hints(global.player_character_data.diff(global.chosen_one_data))

#when entering state, usually you will want to reset internal state here somehow
func enter(fromStateID=null, fromTransitionID=null, inArg0=null,inArg1=null, inArg2=null):
	dialog_box.visible = true
	dialog_box.get_node('Dialogue/Label').text = 'DRAGON: ' + global.dragon_script.read()
	logicRoot.current_turn += 1
	print("Turn # "+ str(logicRoot.current_turn))
	
#when updating state, paramx can be used only if updating fsm manually
func update(deltaTime, param0=null, param1=null, param2=null, param3=null, param4=null):
	pass

#when exiting state
func exit(toState=null):
	dialog_box.visible = false
	pass

##################################################################################
#########                       Connected Signals                        #########
##################################################################################

##################################################################################
#########     Methods fired because of events (usually via Groups interface)  ####
##################################################################################

##################################################################################
#########                         Public Methods                         #########
##################################################################################
var tutor_part = 1

func _on_next_up():
	if $Animator.is_playing():
		$Animator.seek($Animator.get_current_animation_length())
	else:
		if tutor_part < $Animator.get_animation_list().size() -1:
			tutor_part += 1
			$Animator.play($Animator.get_animation_list()[tutor_part])
		else:
			$Dialogue/Button.disabled = true
			change_scene()

##################################################################################
#########                         Inner Methods                          #########
##################################################################################

##################################################################################
#########                         Inner Classes                          #########
##################################################################################

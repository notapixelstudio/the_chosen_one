extends GridContainer
var chosen_action 
signal action_chosen(c_action)

func _ready():
	for action in get_children():
		action.connect("button_up", self, "_on_chosen_action", [action.text])
	
	connect("action_chosen",get_node("/root/Arena/FSMControl/Transitions/ResolveAction"), "_on_chosen_attack")

func _on_chosen_action(action):
	# TODO: Handle action that won't go any further
	print("action "+ action)
	emit_signal("action_chosen", action)

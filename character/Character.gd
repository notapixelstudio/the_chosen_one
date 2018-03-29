extends Node2D

var character

func load_character(ch):
	character = ch
	redraw()
	
func redraw():
	for combo in character.COMBOS:
		var combo_value = ''
		for feature in character.COMBOS[combo]:
			combo_value += character.features[feature] + '_'
		combo_value = combo_value.substr(0, len(combo_value)-1) # remove trailing underscore
		get_node(combo).set_texture(load('res://assets/character/'+combo+'|'+combo_value+'.png'))
		
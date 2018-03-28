extends Node2D

var character

func load_character(ch):
	character = ch
	redraw()
	
func redraw():
	for feature in character.features:
		var value = character.features[feature]
		if value != null:
			get_node(feature).set_texture(load('res://assets/character/'+feature+'_'+value+'.png'))
		else:
			get_node(feature).set_texture(null)
			
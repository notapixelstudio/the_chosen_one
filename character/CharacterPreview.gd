extends Node2D

var character

func load_character(ch):
	character = ch
	update_preview()
	
func update_preview():
	for feature in character.features:
		var value = character.features[feature]
		if value != null:
			$features.get_node(feature).set_texture(load('res://assets/character/'+feature+'_'+value+'.png'))
		else:
			$features.get_node(feature).set_texture(null)
			
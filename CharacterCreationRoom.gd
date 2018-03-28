extends Node

const button_width = 120
const button_height = 34
const theme = preload("res://screens/theme.tres")

func _ready():
	$Character.load_character(global.player_character_data)
	var feats = global.player_character_data.FEATURES # FIXME this should be a static

	var i = 0
	var j = 0
	
	for key in feats:
		var n = Node2D.new()
		n.position = (Vector2(0,0))
		n.name = key
		add_child(n)
		j = 0
		for value in feats[key]:
			var button = Button.new()
			button.set_theme(theme)
			button.set_begin(Vector2(i*button_width,j*button_height))
			button.set_end(Vector2((i+1)*button_width,(j+1)*button_height))
			button.name = value
			button.text = value.replace("_", " ")
			n.add_child(button)
			button.add_to_group(key)
			button.connect("pressed", self, "on_feature_selected", [key,value])
			j+=1
		i+=1
	
func on_feature_selected(feature, value):
	global.player_character_data.features[feature] = value
	$Character.redraw()
	pass
	
	extends Node

var Character
var character

# FIXME to be removed
var hair_types = ['short', 'long']
var hair_i = 0

func _ready():
	# FIXME this should go to the game initialization script
	randomize()
	Character = load('res://character/Character.gd').new().Character
	character = Character.new()
	$CharacterPreview.load_character(character)
	var feats = character.FEATURES
	var nodo_capelli = get_node("hair")

	var i = 0
	var j = 0
	for key in feats:
		var n = get_node(key)
		n.name = key
		j = 0
		for value in feats[key]:
			var button = Button.new()
			button.set_theme(load("res://screens/theme.tres"))
			# TODO: MAtteo guarda queste posizioni
			button.set_begin(Vector2(10,j+90))
			button.set_end(Vector2(90,j+90))
			button.rect_position = Vector2(j+i+90,i+j+100)
			button.name = value
			button.text = value.replace("_", " ")
			n.add_child(button)
			button.add_to_group(key)
			button.connect("pressed", self, "on_feature_selected", [key,value])
			j+=1
	
func on_feature_selected(feature, value):
	character.features[feature] = value
	$CharacterPreview.update_preview()
	pass
	
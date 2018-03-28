	extends Node

var Character
var character

# FIXME to be removed
var hair_types = ['short', 'long']
var hair_i = 0

const button_width = 120
const button_height = 34

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
		var n = Node2D.new()
		n.position = (Vector2(0,0))
		n.name = key
		add_child(n)
		j = 0
		for value in feats[key]:
			var button = Button.new()
			button.set_theme(load("res://screens/theme.tres"))
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
	character.features[feature] = value
	$CharacterPreview.update_preview()
	pass
	
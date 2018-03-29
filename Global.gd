extends Node

var CharacterData
var DragonScript

var player_character_data
var chosen_one_data
var dragon_script

func _ready():
	randomize()
	
	CharacterData = load('res://character/CharacterData.gd').new().CharacterData
	DragonScript = load('res://DragonScript.gd').new().DragonScript

	player_character_data = CharacterData.new()
	chosen_one_data = CharacterData.new()

	dragon_script = DragonScript.new(6)
	
	# FIXME this should be called at battle start
	dragon_script.update_hints(player_character_data.diff(chosen_one_data))
	
func _input(event):
	if event.is_action_pressed('ui_select'):
		print(dragon_script.read())

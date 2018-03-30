extends Node

var CharacterData
var DragonScript

var player_character_data
var chosen_one_data
var dragon_script

const WRONG_FEATURES = 2

func _ready():
	randomize()
	
	CharacterData = load('res://character/CharacterData.gd').new().CharacterData
	DragonScript = load('res://DragonScript.gd').new().DragonScript

	chosen_one_data = CharacterData.new()
	
	# debug feedback
	print('The Chosen One is:')
	print(chosen_one_data.features)
	
	# this is to avoid starting the game with the chosen one by chanche
	# at least WRONG_FEATURES features have to be wrong
	while player_character_data == null or player_character_data.diff(chosen_one_data).size() < WRONG_FEATURES:
		player_character_data = CharacterData.new()

	dragon_script = DragonScript.new(6)
	
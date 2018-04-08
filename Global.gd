extends Node

var CharacterData
var DragonScript
var PlayerScript

var player_character_data
var chosen_one_data
var dragon_script
var player_script

const WRONG_FEATURES = 5
var turns

func _ready():
	randomize()

	CharacterData = load('res://character/CharacterData.gd').new().CharacterData
	DragonScript = load('res://DragonScript.gd').new().DragonScript
	PlayerScript = load('res://PlayerScript.gd').new().PlayerScript

	# the Dragon gives one hint for each feature every round
	turns = CharacterData.FEATURES.size()

	reset()

func reset():
	player_character_data = CharacterData.new()

	# this is to avoid starting the game with the chosen one by chanche
	# at least WRONG_FEATURES features have to be wrong
	while chosen_one_data == null or len(player_character_data.diff(chosen_one_data)['wrong']) < WRONG_FEATURES:
		chosen_one_data = CharacterData.new()
	
	print(chosen_one_data.features)
	
	dragon_script = DragonScript.new(turns)
	player_script = PlayerScript.new(turns)
	
extends Node

var CharacterData
var DragonScript
var PlayerScript

var player_character_data
var chosen_one_data
var dragon_script
var player_script

const WRONG_FEATURES = 3
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
	chosen_one_data = CharacterData.new()

	print(chosen_one_data.features)
	
	# this is to avoid starting the game with the chosen one by chanche
	# at least WRONG_FEATURES features have to be wrong
	while player_character_data == null or player_character_data.diff(chosen_one_data).size() < WRONG_FEATURES:
		player_character_data = CharacterData.new()

	dragon_script = DragonScript.new(turns)
	player_script = PlayerScript.new(turns)
	
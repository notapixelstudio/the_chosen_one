extends Node

var CharacterData

var player_character_data
var chosen_one_data

func _ready():
	randomize()
	
	CharacterData = load('res://character/CharacterData.gd').new().CharacterData

	player_character_data = CharacterData.new()
	chosen_one_data = CharacterData.new()
	
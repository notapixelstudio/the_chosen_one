extends Node

func _ready():
	$Character.load_character(global.player_character_data)
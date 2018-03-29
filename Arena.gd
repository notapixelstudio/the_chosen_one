extends Node

func _ready():
	$Character.load_character(global.player_character_data)
	global.dragon_script.update_hints(global.player_character_data.diff(global.chosen_one_data))
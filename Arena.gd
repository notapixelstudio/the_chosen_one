extends Node

var current_turn
var turns
var is_the_chosen_one = false

func _ready():
	turns = global.turns
	
	if bgm_creation.is_playing():
		bgm_creation.stop()
	if !bgm_battle.is_playing():
		bgm_battle.play()
	# It seems that EnemyTurn State, it is faster than this ready
	# this means that the current_turn will be initialized in EnemyTurn
	# current_turn = 0
	$Character.load_character(global.player_character_data)
	is_the_chosen_one = global.player_character_data.diff(global.chosen_one_data)['same']
	# TODO: Cancellare questa riga! :D
	print("Are you the chosen one?" + str(is_the_chosen_one))
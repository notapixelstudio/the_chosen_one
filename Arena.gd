extends Node

var current_turn
const MAX_TURNS = 6

func _ready():
	# It seems that EnemyTurn State, it is faster than this ready
	# this means that the current_turn will be initialized in EnemyTurn
	# current_turn = 0
	$Character.load_character(global.player_character_data)
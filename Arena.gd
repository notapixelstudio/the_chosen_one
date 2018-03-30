extends Node

var current_turn
const MAX_TURNS = 6
var is_the_chosen_one = false

func _ready():
	# It seems that EnemyTurn State, it is faster than this ready
	# this means that the current_turn will be initialized in EnemyTurn
	# current_turn = 0
	$Character.load_character(global.player_character_data)
	is_the_chosen_one = global.player_character_data.diff(global.chosen_one_data).size() == 0
	# TODO: Cancellare questa riga! :D
	print("Are you the chosen one?" + is_the_chosen_one)
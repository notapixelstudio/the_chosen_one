class PlayerScript:

	# if useless_attack is set to true, we come back to the PlayerAction selection state
	# if is set to false, it will be DragonTurn
	var useful_action = true
	var chosen_action
	var turns

	func _init(turns):
		self.turns = turns

	func attack():
		pass

	func magic():
		pass
	func item():
		pass
	func run():
		pass
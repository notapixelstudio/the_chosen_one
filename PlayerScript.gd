class PlayerScript:

	# if useless_attack is set to true, we come back to the PlayerAction selection state
	# if is set to false, it will be DragonTurn
	var useful_action = true
	var chosen_action
	var turns
	var text = ""

	func _init(turns):
		self.turns = turns
	
	func act(action):
		var action_lower = action.to_lower()
		if action_lower =="attack":
			useful_action = true
			chosen_action = "attack"
			text = "I'MMA DOING ATTACK" # you can call a func
		elif action_lower=="magic":	
			useful_action = true
			chosen_action = "magic"
			text = "bidibi bodibi bo" # you can call a func
		elif action_lower == "item":
			useful_action = false
			chosen_action = "item"
			text = "You don't have any item" # you can call a func
		elif action_lower == "run":
			useful_action = false
			chosen_action = "run"
			text = "Fly, You fools" # you can call a func
		else:
			text = "This should never happen!" # you can call a func
	
	func read():
		pass
	func attack():
		pass

	func magic():
		pass
	func item():
		pass
	func run():
		pass
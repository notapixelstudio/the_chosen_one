class PlayerScript:

	# if useless_attack is set to true, we come back to the PlayerAction selection state
	# if is set to false, it will be DragonTurn
	var useful_action = true
	var chosen_action
	var turns
	var text = ""

	var attack_lines = [
		"You try to move towards the dragon, but you are paralyzed by fear..."
	]
	var magic_lines = [
		"You wave your hands into the air and... nothing happens.",
		"You focus your mind on your inner energy. Then you get distracted by a butterfly.",
		"You travel back your magic training class... which you never took.",
		"You start moving your hands to tap into your mana reserves... but they are empty. You are screwed."
	]
	var item_lines = [
		"You haven't collected any item yet...",
		"...and continuing to click here would never help you collecting any item.",
		"You frantically search your pockets, and finally you find... a button."
	]
	var run_lines = [
		"You refuse to run away! Not beacuse of courage, your legs are shaking..."
	]

	func _init(turns):
		self.turns = turns
	
	func act(action):
		chosen_action = action.to_lower()
		if not(chosen_action in ['attack', 'magic', 'item', 'run']):
			text = "This should never happen!"
			return
		
		call(chosen_action)
	
	func attack():
		useful_action = true
		if len(attack_lines) == 0:
			text = "There's always someone stronger than you. In your case, everyone."
		else:
			text = attack_lines.pop_front()

	func magic():
		useful_action = true
		if len(magic_lines) == 0:
			text = "It seems that you are a muggle, after all."
		else:
			text = magic_lines.pop_front()

	func item():
		useful_action = true
		if len(item_lines) == 0:
			text = "You can select 'item' as many times as you want, nothing is going to happen!"
		else:
			text = item_lines.pop_front()

	func run():
		useful_action = true
		if len(run_lines) == 0:
			text = "You can run as many times as you want, nothing is going to happen!"
		else:
			text = run_lines.pop_front()

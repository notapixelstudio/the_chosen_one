class PlayerScript:

	# if useless_attack is set to true, we come back to the PlayerAction selection state
	# if is set to false, it will be DragonTurn
	var useful_action = true
	var chosen_action
	var turns
	var text = ""

	var attack_lines = [
		"You try to move towards the dragon, but you are paralyzed by fear...",
		"You hit yourself in confusion.",
		"Your weapon is slipping from your soaked hands...",
		"You hit nothing but air. Not that you aimed at anything first...",
		"You just can't fight that huge Dragon...",
		"You blame the Prophecy that took you here, while you continue to slice away the void.",
		"Your attacks have no effect. You start to wonder if you were not the Chosen One after all."
	]
	var magic_lines = [
		"You wave your hands into the air and... nothing happens.",
		"You focus your mind on your inner energy. Then you get distracted by a butterfly.",
		"You reach for the memories of your magic training class... which you never took.",
		"You feel like you could take control of the elements... but that's just a feeling.",
		"You decide to intone a chant to gather energy... but all you could rember is 'Jingle Bells'.",
		"You meditate to focus your willpower. The Dragon disappears! ...then you open your eyes.",
		"You start moving your hands to tap into your mana reserves... but they are empty. You are screwed."
	]
	var item_lines = [
		"You haven't collected any item yet...",
		"...and continuing to click here would never help you collecting any item.",
		"You inspect your backpack... Where's your backpack!?",
		"You frantically search your pockets, and finally you find... a button.",
		"You press I to bring up the inventory... nothing happens.",
		"You recall to have packed a mighty artifact... but you must have left it in your other pants."
	]
	var run_lines = [
		"You refuse to run away! Not beacuse of courage, but because your legs are shaking...",
		"You are frozen in your position.",
		"You manage to gather all your strentgh and take a step... in the direction of the Dragon.",
		"You can no longer escape.",
		"You finally manage to start running! ...in circles."
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
			text = "You finally realize that there's always someone stronger than you. In your case, everyone."
		else:
			text = attack_lines.pop_front()

	func magic():
		useful_action = true
		if len(magic_lines) == 0:
			text = "You give up trying magic. It seems that you are a muggle, after all."
		else:
			text = magic_lines.pop_front()

	func item():
		useful_action = true
		if len(item_lines) == 0:
			text = "You conclude that you can be happy even if you have nothing."
		else:
			text = item_lines.pop_front()

	func run():
		useful_action = true
		if len(run_lines) == 0:
			text = "You learn that running away from problems is not a real solution. Especially if you can't run."
		else:
			text = run_lines.pop_front()

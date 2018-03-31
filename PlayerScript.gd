class PlayerScript:

	# if useless_attack is set to true, we come back to the PlayerAction selection state
	# if is set to false, it will be DragonTurn
	var useful_action = true
	var chosen_action
	var turns
	var text = ""
	var chosen_one = false

	var attack_lines = [
		"You try to move towards the dragon, but you are paralyzed by fear...",
		"You hurt yourself in your confusion.",
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

	var chosen_attack_lines = [
		"Your first hit pierce through The Dragon's scales like butter.",
		"You barely move your weapon, yet The Dragon is seriously wounded.",
		"You just think about attacking The Dragon, and a wound appears.",
		"You point your weapon at The Dragon. Its HP bar starts to slowly drain...",
		"You decide to spare The Dragon instead. This still hurts it in some mysterious way."
	]
	var chosen_magic_lines = [
		"You conjure a small fireball, but somehow it manages to burn the left eye of The Dragon.",
		"You cast a tiny freeze ray, but somehow you manage to freeze the right eye of The Dragon",
		"You just try a simple spell, but a lightning bolt comes out instead and strikes The Dragon."
	]
	var chosen_item_lines = [
		"You throw a rock at The Dragon. It appears that The Dragon is allergic to the specific combination of minerals in it."
	]
	var chosen_run_lines = [
		"You take a step back. This triggers a trap that hits The Dragon."
	]

	func _init(turns):
		self.turns = turns

	func update_hints(diff):
		chosen_one = diff.size() == 0
	
	func act(action):
		chosen_action = action.to_lower()
		if not(chosen_action in ['attack', 'magic', 'item', 'run']):
			text = "This should never happen!"
			return
		
		if chosen_one:
			call('chosen_one_' + chosen_action)
		else:
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


	func chosen_one_attack():
		useful_action = true
		if len(chosen_attack_lines) == 0:
			text = "Whatever you do, The Dragon is hit."
		else:
			text = chosen_attack_lines.pop_front()

	func chosen_one_magic():
		useful_action = true
		if len(chosen_magic_lines) == 0:
			text = "Whatever you imagine to conjure, it appears and attacks The Dragon."
		else:
			text = chosen_magic_lines.pop_front()

	func chosen_one_item():
		useful_action = true
		if len(chosen_item_lines) == 0:
			text = "Whatever you search for helping you against The Dragon, you find it in your pockets."
		else:
			text = chosen_item_lines.pop_front()

	func chosen_one_run():
		useful_action = true
		if len(chosen_run_lines) == 0:
			text = "Whatever reason you had to run away from The Dragon, it vanished."
		else:
			text = chosen_run_lines.pop_front()

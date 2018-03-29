class DragonScript:
	var hint_lines = {
		'weapon': {
			'sword': [
				'Being unoriginal will not save you, nor anyone else.',
				'Oh, you like classic choices! Me too. I always eat humans with no fancy spices or sauce.',
				'A sword! How unexpected! Us dragons are so unfamiliar with the concept of heroes with swords that we are always caught by surprise when they show up...'
			],
			'axe': [
				'Axe bleah'
			],
			'staff': [
				'Staff bleah'
			],
			'dagger': [
				'Dagger bleah'
			]
		},
		'hair': {
			'short_white': [
				'short_white bleah'
			],
			'short_pink': [
				'short_pink bleah'
			],
			'short_black': [
				'short_black bleah'
			],
			'short_blue': [
				'short_blue bleah'
			],
			'short_green': [
				'short_green bleah'
			],
			'long_white': [
				'long_white bleah'
			],
			'long_pink': [
				'long_pink bleah'
			],
			'long_black': [
				'long_black bleah'
			],
			'long_blue': [
				'long_blue bleah'
			],
			'long_green': [
				'long_green bleah'
			]
		}
	}
	var babbling_lines = []

	var wrong_features
	var facing_the_chosen_one

	var turns
	var hints = 0

	var lines = []
	
	func _init(turns):
		self.turns = turns

	func increase_hints(amount):
		hints = min(hints + amount, turns)

	func update_hints(wrong_features):
		self.wrong_features = wrong_features

		facing_the_chosen_one = len(wrong_features) == 0

	func get_wrong_feature():
		return wrong_features[randi() % len(wrong_features)]

	func read():
		if facing_the_chosen_one:
			return "Nuoo! Il ciosen uan!!" # FIXME
		else:
			if len(lines) == 0:
				increase_hints(2)
				lines = get_lines(hints, turns-hints)
			
			return lines.pop_front()

	func next_hint_line(feature, value):
		if not(feature in hint_lines) or not(value in hint_lines[feature]):
			return null
		
		if len(hint_lines[feature][value]) == 0:
			return "You are not the sharpest tool in the shed, huh? Your " + value + " " + feature + " won't do."
			
		return hint_lines[feature][value].pop_front()

	func next_babbling_line():
		if len(babbling_lines) == 0:
			babbling_lines = shuffleList([
				"Bwahahahaha! Fool!",
				"You'll never defeat me!",
				"I'll tear you into little pieces!",
				"I'll crush you into smithereens!",
				"You are just a tiny human...",
				"How dare you to face me?",
				"Courage and recklessness are two faces of the same medal.",
				"Stupid human!",
				"Mmm... I am hungry.",
				"There's nothing you can do to win this fight!",
				"You are hopeless, like the rest of humankind.",
				"Has your kingdom ran out of actual fighters?",
				"Why are you even trying?",
				"My power is boundless."
			])

		return babbling_lines.pop_front()

	func get_lines(hints, babbling):
		var lines = []

		for i in range(hints):
			lines.append('hint_line')

		for i in range(babbling):
			lines.append('babbling_line')

		# this should stay here beacuse we don't want to shuffle
		# hint lines, becaue they follow a progression
		lines = shuffleList(lines) 
			
		for i in range(len(lines)):
			if lines[i] == 'hint_line':
				var wrong_feature = get_wrong_feature()
				lines[i] = next_hint_line(wrong_feature['feature'], wrong_feature['value'])
			else:
				lines[i] = next_babbling_line()

		return lines

	# from https://godotengine.org/qa/2547/how-to-randomize-a-list-array
	func shuffleList(list):
		var shuffledList = []
		var indexList = range(list.size())
		for i in range(list.size()):
			randomize()
			var x = randi()%indexList.size()
			shuffledList.append(list[x])
			indexList.remove(x)
			list.remove(x)
		return shuffledList

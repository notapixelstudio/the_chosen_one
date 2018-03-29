class DragonScript:
	var hint_lines = {
		'weapon': {
			'sword': [
				'Being unoriginal will not save you, nor anyone else.',
				'Oh, you like classic stuff! Me too. I always eat humans with no fancy spices or sauce.',
				'A sword! How unexpected! Us dragons are so unfamiliar with the concept of heroes with swords that we are always caught by surprise when they show up...'
			],
			'axe': [
				"Did you stole that thing from a dead dwarf? It will be useless to you too..."
			],
			'staff': [
				"This is not a hike. This is a battle.",
				"Afraid of sharp objects? Mee too.",
				"Oh, I suppose the blacksmith was already closed...",
				"Even a putter would hurt me more than that wood you carry!",
				"Wrong place. The pool billiard house is two blocks south from here."
			],
			'dagger': [
				"It's not like they say, you know? Size does matter!",
				"Sorry, no toothpicks allowed here.",
				"Was a proper, bigger weapon too heavy to carry? Oh, I can totally relate."
			]
		},
		'haircut': {
			'short': [
				"The Prophecy was wrong... The Chosen One is said to have beautiful, long hair. But wait... Prophecies are never wrong!"
			],
			'long': [
				"Such long hair and such a short life... what a pity!",
				"Are you an idiot? That haircut is way too impractical for a boss fight!"
			]
		},
		'hair-color': {
			'white': [
				"Poor little angel. I'll send you back to heaven in a minute.",
				"You are nothing but a sheep about to be prayed upon.",
				"All of a sudden, I have a craving for cotton candy..."
			],
			'pink': [
				"I'll chew you like bubblegum!"
			],
			'black': [
				"Mmm... Am I supposed to be scared by a tenebrous figure? I am a monster, remember?"
			],
			'blue': [
				"I feel like Gargamel...",
				"Roses are red, humans are blue / I just can't eat flowers, so I will eat you."
			],
			'green': [
				"Great! You arrived just in time for my new veggie diet!"
			]
		},
		'eyes': {
			'blue': [
				"Bleah femeref"
			],
			'green': [
				"Bleah green"
			],
			'red': [
				"Bleah red"
			],
			'four': [
				"Bleah four"
			]
		}
	}
	var defeat_lines = []
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
		return wrong_features[randi() % wrong_features.size()]

	func read():
		if facing_the_chosen_one:
			return next_defeat_line()
		else:
			if len(lines) == 0:
				increase_hints(2)
				lines = get_lines(hints, turns-hints)
			
			return lines.pop_front()

	func next_hint_line(feature, value):
		if not(feature in hint_lines) or not(value in hint_lines[feature]):
			return null
		
		if len(hint_lines[feature][value]) == 0:
			var readable_feature = feature.replace('-',' ')
			var readable_value = value.replace('-',' ')
			return [
				"You are not the sharpest tool in the shed, huh? Your " + readable_value + " " + readable_feature + " won't do.",
				"The Chosen One has no " + readable_value + " " + readable_feature + ".",
				"Wrong " + readable_feature + ". Got it? You are doomed.",
				"Did you ever have the feeling of being controlled by a superior entity? What if that entity were a clueless human like you?",
				"Do you think before you act? I think you should try sometimes. It is an enlighting experience.",
				"Guess who is the Chosen One? Not you.",
				"Why don't you try a different " + readable_feature + "? Just for fun, I asked for no real reason.",
				"There is no mention of a " + readable_value + " " + readable_feature + " like yours in the Prophecy."
			][randi() % 8]
			
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
				"Stupid, stupid human!",
				"Mmm... I am hungry.",
				"There's nothing you can do to win this fight!",
				"You are hopeless, like the rest of humankind.",
				"Has your kingdom ran out of actual fighters?",
				"Why are you even trying?",
				"My power is boundless.",
				"Ahh, fresh meat!"
			])

		return babbling_lines.pop_front()

	func next_defeat_line():
		if len(defeat_lines) == 0:
			defeat_lines = [
				"You... you...",
				"That's impossible...",
				"That's not fair... my power...",
				"The Prophecy was right...",
				"I'm shaking, I'm shaking...",
				"No...",
				"NOOOOO!"
			]

		return defeat_lines.pop_front()

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
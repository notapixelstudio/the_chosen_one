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
				"All of a sudden, I have a craving for cotton candy...",
				"Life's a bleach, isn't it?",
				"Having white hair apparently is not enough to make a human wiser..."
			],
			'pink': [
				"I'll chew you like bubblegum!",
				"What a cute, sweet, little human! You'll make a fine plushie.",
				"Maybe if you rolled an eighteen at strength instead of cuteness...",
				"Wait... Where did you buy that flamingo hat?",
				""
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
				"Too much spice, huh?",
				"Never heard of a Fremen hero. Maybe because there aren't any."
			],
			'green': [
				"Bleah green"
			],
			'red': [
				"Bleah red"
			],
			'four': [
				"Those glasses make you look fat.",
				"I don't hit humans with glasses. Or do I?"
			]
		},
		'house': {
			'Valenstone': [
				"This will be your last battle.",
				"Where's the rest of the army? Did they left you all alone?",
				"Aren't you curious to see what happens when a metal armor reaches a gazillion degrees?",
				"Silly humans, always trying to wage war at one another. What a waste of food.",
				"Aren't you a little short to be a Valenstone?"
			],
			'Golddagger': [
				"Say goodbye to your precious little life.",
				"Why didn't you hire some mercenaries to help you?",
				"You can't buy me. I'm not one of those treasure-hoarder dragons.",
				"Did you remember to make a will? Watching your family fighting over your riches would break my heart.",
				"I hope you did pay your debts. Aren't Golddaggers known for that?"
			],
			'Hollistar': [
				"Say your prayers, little one.",
				"Maybe if you believe it very hard, I'll disappear.",
				"Your gods can't save you. Fun fact: they don't exist.",
				"Your faith means nothing. The Prophecy is the only truth.",
				"Hollistars are said to be tough... to chew. Too bad for me, I have to eat something after all."
			],
			'Weedlepuff': [
				"How can you be sure that I'm really here and I'm not just some kind of hallucination?",
				"Do you happen to know a good druid? My stash is empty...",
				"Wouldn't it be better if all you hippies went looking for a job? Besides killing dragons, of course.",
				"You make me wonder wether I should eat you or light you up and smoke you...",
				"I'm a living thing you know? What makes you the right to save the trees and kill the dragons?",
				"If only Weedlepuffs weren't so busy caring for literally every single leaf on the kingdom... they could even defeat a dragon. Maybe."
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

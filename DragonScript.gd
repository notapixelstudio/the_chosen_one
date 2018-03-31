class DragonScript:
	var hint_lines = {
		'weapon': {
			'sword': [
				'Being unoriginal will not save you, nor anyone else.',
				'Oh, you like classic stuff! Me too. I always eat humans with no fancy spices or sauce.',
				'A sword! How unexpected! Us dragons are so unfamiliar with the concept of heroes with swords that we are always caught by surprise when they show up...'
			],
			'axe': [
				"Did you stole that thing from a dead dwarf? It will be useless to you too...",
				"Double-edged weapons can backfire, you know? They are double edged, after all.",
				"Careful with that axe, human..."
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
				"Humans should not send their children to fight dragons...",
				"Do you cut your hair by yourself? With a knife?",
				"Want to save money on shampoo and conditioner? Smart move. Better than showing up here, at the very least.",
				"The Prophecy was wrong... The Chosen One is said to have beautiful, long hair. But wait... Prophecies are never wrong!"
			],
			'long': [
				"Oooh, imagine the burning smell you'll do when I light you up!",
				"Be careful not to trip onto yourself...",
				"Such long hair and such a short life... what a pity!",
				"Are you an idiot? That haircut is way too impractical for a boss fight!"
			]
		},
		'hair-color': {
			'white': [
				"Poor little angel. I'll send you back to heaven in a minute.",
				"Life's a bleach, isn't it?",
				"You are nothing but a sheep about to be prayed upon.",
				"All of a sudden, I have a craving for cotton candy...",
				"Having white hair apparently is not enough to make a human wiser..."
			],
			'pink': [
				"I'll chew you like bubblegum!",
				"What a cute, sweet, little human! You'll make a fine plushie.",
				"Maybe if you rolled an eighteen at strength instead of cuteness...",
				"Wait... Where did you buy that flamingo hat?"
			],
			'black': [
				"Did you fall into a puddle of ink?",
				"How many crows did you kill to make that hat?",
				"Mmm... Am I supposed to be scared by a tenebrous figure? I am a monster, remember?"
			],
			'blue': [
				"I feel like Gargamel...",
				"Everyone has the blues sometimes... Always, in your particular case.",
				"Roses are red, humans are blue / I just can't eat flowers, so I will eat you."
			],
			'green': [
				"Great! You arrived just in time for my new veggie diet!",
				"Oh, for a moment I took you for a tree.",
				"Are you planning to start photosynthesizing?",
				"If I water you, will you grow taller?"
			]
		},
		'eyes': {
			'blue': [
				"No one knows what it's like behind your eyes, right?",
				"Your sapphire eyes don't scare me. Nothing can.",
				"Too much spice, huh?",
				"No one ever told you that you have baby eyes?"
			],
			'green': [
				"It's a real pity... I have to incinerate that pair of emeralds of yours.",
				"You remind me of a Shakespearean monster of jealousy...",
				"I'll take your green eyes and make a necklace with them."
			],
			'red': [
				"Your burning gaze is nothing compared to my incendiary blow.",
				"If you stare too much at the fire, your red eyes will melt. Wanna try?",
				"Did you just have an all-nighter?",
				"I'll take your red eyes and make a bracelet with them."
			],
			'four': [
				"How many fingers are these?",
				"Hey! I'm here! ...are you sure you can see me? Bwahaha!",
				"Oh, the intellectual type! Let's see if you can outsmart me.",
				"Those glasses make you look fat.",
				"I don't hit humans with glasses. Or do I?"
			]
		},
		'house': {
			'Valenstone': [
				"This will be your last battle, Valenstone.",
				"Where's the rest of the Valenstone army? Did they left you all alone?",
				"Aren't you curious to see what happens when a metal armor reaches a gazillion degrees?",
				"Silly humans, always trying to wage war at one another. What a waste of food.",
				"Aren't you a little short to be a Valenstone?"
			],
			'Golddagger': [
				"Say goodbye to your precious little life.",
				"Why didn't you hire some mercenaries to help you?",
				"You can't buy me, Golddagger. I'm not one of those treasure-hoarder dragons.",
				"Did you remember to make a will? Watching your family fighting over your riches would break my heart.",
				"I hope you did pay your debts before coming here to die. Aren't Golddaggers known for that?"
			],
			'Hollistar': [
				"Say your prayers to the holy stars, little one.",
				"Maybe if you believe it very hard like you do with your gods in the sky, I'll disappear.",
				"Your gods can't save you. Fun fact: they don't exist.",
				"Your faith in the holy stars means nothing. The Prophecy is the only truth.",
				"Hollistars are said to be tough... to chew. But I have good teeth, fortunately. For me. Not for you."
			],
			'Weedlepuff': [
				"How can you be sure that I'm really here and I'm not just some kind of hallucination?",
				"Do you happen to know a good Weedlepuff druid? My stash is empty...",
				"Wouldn't it be better if all you hippies went looking for a job? Besides trying to kill dragons, of course.",
				"You make me wonder wether I should eat you or light you up and smoke you...",
				"I'm a living thing you know? What makes you Weedlepuffs the right to save the trees and kill the dragons?",
				"If only Weedlepuffs weren't so busy caring for literally every single leaf on the kingdom... they could even defeat a dragon. Joking."
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
				increase_hints(4)
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
				"Yummy.. I am hungry.",
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

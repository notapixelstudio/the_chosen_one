class CharacterData:
	const FEATURES = {
		'hair': [
			'long_white', 'long_black', 'long_green', 'long_blue', 'long_pink',
			'short_white', 'short_black', 'short_green', 'short_blue', 'short_pink'
		],
		'weapon': ['sword', 'dagger', 'staff', 'axe']
	}
	var features = {}

	func _init():
		randomize_features()
		
	func randomize_features():
		for f in FEATURES:
			features[f] = FEATURES[f][randi() % len(FEATURES[f])]
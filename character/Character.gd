class Character:
	const FEATURES = {
		'hair': ['long_white', 'long_green', 'long_blue', 'short_white', 'short_green', 'short_blue'],
		'weapon': ['sword', 'dagger', 'staff']
	}
	var features = {}

	func _init():
		randomize_features()
		
	func randomize_features():
		for f in FEATURES:
			features[f] = FEATURES[f][randi() % len(FEATURES[f])]
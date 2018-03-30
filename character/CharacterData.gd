class CharacterData:
	const FEATURES = {
		'haircut': ['short', 'long'],
		'hair-color': ['white', 'black', 'green', 'blue', 'pink'],
		'eyes': ['blue', 'green', 'red', 'four'],
		'weapon': ['sword', 'dagger', 'staff', 'axe'],
		'house': ['Valenstone', 'Golddagger', 'Hollistar', 'Weedlepuff']
	}
	const COMBOS = {'hair': ['haircut', 'hair-color'], 'weapon': ['weapon'], 'eyes': ['eyes'], 'house': ['house']}
	var features = {}

	func _init():
		randomize_features()
		
	func set_feature(feature, value):
		# validation
		if not(feature in features) or not(value in FEATURES[feature]):
			return

		features[feature] = value
	
	func randomize_features():
		for f in FEATURES:
			features[f] = FEATURES[f][randi() % len(FEATURES[f])]

	func diff(chosen_one):
		var wrong_features = []
		for feature in FEATURES:
			if features[feature] != chosen_one.features[feature]:
				wrong_features.append({'feature': feature, 'value': features[feature]})

		return wrong_features
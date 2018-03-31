class CharacterData:
	const FEATURES = {
		'house': ['Valenstone', 'Golddagger', 'Hollistar', 'Weedlepuff'],
		'weapon': ['sword', 'dagger', 'staff', 'axe'],
		'haircut': ['short', 'long'],
		'hair-color': ['white', 'black', 'green', 'blue', 'pink'],
		'eyes': ['blue', 'green', 'red', 'four']
	}
	const COMBOS = {'house': ['house'], 'weapon': ['weapon'], 'hair': ['haircut', 'hair-color'], 'eyes': ['eyes']}
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
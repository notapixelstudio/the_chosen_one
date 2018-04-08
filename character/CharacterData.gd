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
		var diff_result = {
			'wrong': [],
			'correct': [],
			'same': false
		}

		for feature in FEATURES:
			if features[feature] != chosen_one.features[feature]:
				diff_result['wrong'].append({'feature': feature, 'value': features[feature]})
			else:
				diff_result['correct'].append({'feature': feature, 'value': features[feature]})

		diff_result['same'] = len(diff_result['wrong']) == 0
		
		return diff_result
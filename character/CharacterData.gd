class CharacterData:
	const FEATURES = {
		'hair': [
			'long_white', 'long_black', 'long_green', 'long_blue', 'long_pink',
			'short_white', 'short_black', 'short_green', 'short_blue', 'short_pink'
		],
		'weapon': ['sword', 'dagger', 'staff', 'axe']
	}
	var features = {}
	var save_filename

	func set_feature(feature, value):
		# validation
		if not(feature in features) or not(value in FEATURES[feature]):
			return

		features[feature] = value
		savefile()
	
	func randomize_features():
		for f in FEATURES:
			features[f] = FEATURES[f][randi() % len(FEATURES[f])]
		
		savefile()

	func _init(save_filename):
		self.save_filename = save_filename
		loadfile()
		
	func loadfile():
		print('load')
		var savefile = load(save_filename)
		if savefile == null:
			# no stored character yet, create a new random one
			randomize_features()
		else:
			loadfile()

	func savefile():
		print('save')
		var save_file = File.new()
		save_file.open(save_filename, File.WRITE)
		save_file.store_line(to_json(features))
		save_file.close()
		
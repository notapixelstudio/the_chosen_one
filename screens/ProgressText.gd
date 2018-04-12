extends RichTextLabel

const WAIT_TIME= 2.0
var loading_lines = ["Sharpening Dragon's teeth", 
"Recovering old pages from the prophecy",
"Extracting the right amount of melanin",
"Calling the blacksmith",
"Determination of polygenic phenotypic characters",
"Rediscovering family trees" ]

func _ready():
	#Transition back everytime a screen is loaded
	var lines = shuffleList(loading_lines)
	while true:
		yield(get_tree().create_timer(WAIT_TIME),"timeout")
		set_text(lines.pop_back())

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
extends Node

var Character
var character

func _ready():
	Character = load('res://character/Character.gd').new().Character
	character = Character.new()
	$CharacterPreview.load_character(character)
	
func _input(event):
	if event.is_action_pressed('ui_select'):
		character.features.hair = null
		$CharacterPreview.update_preview()
		
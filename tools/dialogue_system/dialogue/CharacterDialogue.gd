# CharacterDialogue.gd

extends Resource

class_name CharacterDialogue

export (Texture) var speaker_portrait = preload("res://icon.png")
export (String) var speaker_name = "Godobot"

export (PoolStringArray) var dialog_slides = PoolStringArray([
	"Greetings, User! I am Godobot, at your assistance!",
	"What can I do for you today?"
])

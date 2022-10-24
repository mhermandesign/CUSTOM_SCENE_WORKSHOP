# gun.gd

extends Spatial

export (Resource) var gun_statblock

func _ready():
	if not InputMap.get_action_list("fire_1"):
		InputMap.add_action("fire_1")
	var event = InputEventMouseButton.new()
	event.button_index = BUTTON_LEFT
	InputMap.action_add_event("fire_1", event)
	print(InputMap.get_action_list("fire_1"))

func fire():
	print(name + " is firing!")

func _input(event):
	if Input.is_action_just_pressed("fire_1"):
		print("pew!")
		fire()

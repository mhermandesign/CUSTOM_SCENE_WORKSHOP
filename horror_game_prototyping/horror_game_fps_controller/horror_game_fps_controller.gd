extends "res://fps_controller/fps_controller.gd"

export var BATTERY_DRAIN = 1.0
onready var Flashlight: SpotLight = get_node("Camera/Flashlight")
onready var BatteryBar: ProgressBar = get_node("CanvasLayer/HUD/HBoxContainer/ProgressBar")

var battery: float = 100.0

func toggle_flashlight():
	print("boop")

func _process(delta):
	if Flashlight:
		battery -= delta * BATTERY_DRAIN
		
		battery = clamp(battery, 0.0, 100.0)
		
		if battery < 1.0:
			Flashlight.light_energy = battery
		else:
			Flashlight.light_energy = 1.0
			
	if BatteryBar:
		BatteryBar.value = battery

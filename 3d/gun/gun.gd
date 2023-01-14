# gun.gd

extends Spatial

export (Resource) var gun_statblock

onready var BulletRayCast: RayCast = get_node("BulletRayCast")

func _ready():
	if not InputMap.get_action_list("fire_1"):
		InputMap.add_action("fire_1")
	var event = InputEventMouseButton.new()
	event.button_index = BUTTON_LEFT
	InputMap.action_add_event("fire_1", event)
	print(InputMap.get_action_list("fire_1"))

func fire():
	print(name + " is firing!")
	BulletRayCast.set("enabled", true)
	var collider = BulletRayCast.get_collider()
	if collider:
		print("bullet collided with " + collider.name)
		if collider is RigidBody:
			print("bullet collider is rigidbody")
			collider.sleeping = false
			collider.add_force(self.global_transform.origin.direction_to(collider.global_transform.origin) * 100, BulletRayCast.get_collision_normal())

func _input(event):
	if Input.is_action_just_pressed("fire_1"):
		print("pew!")
		fire()

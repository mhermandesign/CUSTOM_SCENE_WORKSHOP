# BoidsEngine.gd
extends Node2D

onready var Boid = load("res://boids/Boid.tscn")
onready var boids = PoolVector2Array([Vector2(0,0)])
	
func _ready():
	spawn_boids(8)

func _draw():
	var mouse_position: Vector2 = get_tree().root.get_mouse_position()
	draw_circle(mouse_position + Vector2(-96,-96), 100, Color(1.0, 1.0, 0.0, 0.2))

func _process(delta):
	update()

func _physics_process(delta):
	
	pass

func spawn_boids(quantity = 1):
	for i in quantity:
		add_child(Boid.instance())

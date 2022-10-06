extends RigidBody2D

class_name GameObject2D

var collision_shape: CollisionShape2D
var sprite: Sprite


func _enter_tree():
	add_child(CollisionShape2D.new())
	
	add_child(Sprite.new())
	
	print(get_children())

func _ready():
	print(collision_shape)
	print(sprite)

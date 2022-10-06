extends KinematicBody2D

var mouse_position: Vector2

func _ready():
	global_transform.origin = get_viewport_rect().size / 2 + (Vector2(
		rand_range(-10, 10),
		rand_range(-10, 10)
	))
	
func _input(event):
	if event is InputEventMouseMotion:
		mouse_position = get_tree().root.get_mouse_position()


func _physics_process(delta):
#	move_and_slide(transform.basis_xform(Vector2.RIGHT) * 256)
	move_and_slide(Vector2.UP * 80)
	look_at(mouse_position)

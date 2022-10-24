extends RayCast

export (PackedScene) var explosion_scene = preload("res://physics_explosion/PhysExplosion.tscn")

func _physics_process(delta):
	if get_collider():
		boom()
		
func boom():
	var new_explosion = explosion_scene.instance()
	get_parent_spatial().add_child(new_explosion)
	new_explosion.global_transform = self.global_transform
	self.queue_free()

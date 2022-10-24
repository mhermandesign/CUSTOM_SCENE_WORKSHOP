# boom_barrel.gd

extends RigidBody

export (PackedScene) var explosion_scene = preload("res://physics_explosion/PhysExplosion.tscn")

func _on_BoomBarrel_body_entered(body):
	if body.is_in_group("hurtful"):
		boom()


func _on_Area_area_entered(area):
	if area.is_in_group("hurtful"):
		boom()


func boom():
	var new_explosion = explosion_scene.instance()
	get_parent_spatial().add_child(new_explosion)
	new_explosion.global_transform = self.global_transform
	self.queue_free()



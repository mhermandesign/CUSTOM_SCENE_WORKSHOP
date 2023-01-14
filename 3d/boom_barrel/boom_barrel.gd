# boom_barrel.gd

extends RigidBody


func _on_BoomBarrel_body_entered(body):
	if body.is_in_group("hurtful"):
		boom()


func _on_Area_area_entered(area):
	if area.is_in_group("hurtful"):
		boom()


func boom():
	self.queue_free()



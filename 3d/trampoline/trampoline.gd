extends Area

func _on_Trampoline_body_entered(body):
	if body is RigidBody:
		body.apply_central_impulse(Vector3.UP * body.mass * 100)

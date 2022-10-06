extends RigidBody

export onready var damage: int = 0
export onready var damage_threshold: int = 3
export onready var ExplosionParticles: PackedScene = preload("res://physics_explosion/ExplosionParticles.tscn")

var do_explode: bool = false

func _enter_tree():
	add_to_group("damageable")

func _physics_process(delta):
	if do_explode:
		explode()
		do_explode = false
		

func take_damage(amount: int):
	damage += amount
	if damage > damage_threshold:
		do_explode = true

func explode():
	if self.is_inside_tree():
		var explosion_particles = ExplosionParticles.instance()
		add_child(explosion_particles)
		explosion_particles.emitting = true
		
		for body in $ExplosionArea.get_overlapping_bodies():
			var rb := body as RigidBody
			if rb:
				rb.add_central_force(self.global_transform.origin.direction_to(rb.global_transform.origin) * 5000)
		
		$AudioStreamPlayer3D.pitch_scale = rand_range(0.9,1.1)
		$AudioStreamPlayer3D.play()
		yield(get_tree().create_timer(explosion_particles.lifetime), "timeout")
		print("now what?")

func _on_BoomBarrel_body_entered(body):
	if body.is_in_group("hurtful"):
		if body.get_property_list().has("contact_damage"):
			take_damage(body.contact_damage)
		else:
			take_damage(1)

extends RigidBody

export (NodePath) onready var CameraRig = get_node(CameraRig)

func _physics_process(delta: float):
	reset_dust_particles(delta)
	
	if Input.is_action_pressed("ui_up"):
		$DustParticles.process_material.set("spread", 5.0)
		$DustParticles.process_material.set("initial_velocity", 50.0)
		apply_central_impulse(-CameraRig.global_transform.basis.z * 3500 * delta)
	
	if Input.is_action_pressed("ui_down"):
		apply_central_impulse(CameraRig.global_transform.basis.z * 3500 * delta)
	
	if Input.is_action_pressed("ui_left"):
		apply_central_impulse(-CameraRig.global_transform.basis.x * 3500 * delta)
	
	if Input.is_action_pressed("ui_right"):
		apply_central_impulse(CameraRig.global_transform.basis.x * 3500 * delta)
	
	if Input.is_action_just_pressed("sprint"):
		$DustParticles.set("explosiveness", 1.0)
		
		$DustParticles.process_material.set("spread", 5.0)
		$DustParticles.process_material.set("initial_velocity", 50.0)
		$DustParticles.process_material.set("direction", CameraRig.global_transform.basis.z)
		apply_central_impulse(-CameraRig.global_transform.basis.z * 2000)
	
	if Input.is_action_just_pressed("ui_select"):
		$DustParticles.set("explosiveness", 1.0)
		
		$DustParticles.process_material.set("spread", 10.0)
		$DustParticles.process_material.set("direction", Vector3.DOWN)
		$DustParticles.process_material.set("initial_velocity", 50.0)
		apply_central_impulse(Vector3.UP * 1500)

func reset_dust_particles(delta: float):
	$DustParticles.global_rotation = Vector3.ZERO
	$DustParticles.set("explosiveness", 0.0)
	
	$DustParticles.process_material.set("direction", Vector3.DOWN)
	$DustParticles.process_material.set("initial_velocity", lerp($DustParticles.process_material.initial_velocity, 5.0, delta))
	$DustParticles.process_material.set("spread", lerp($DustParticles.process_material.spread, 50.0, delta))

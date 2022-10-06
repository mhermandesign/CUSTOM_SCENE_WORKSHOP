extends KinematicBody

export var WALK_SPEED := 8
export var MOUSE_SENSITIVITY := 0.04
export var GRAVITY := 9.8
export var ATTACK_DAMAGE := 1

onready var FirstPersonCamera: Camera = get_node("FirstPersonCamera")
onready var InteractionRayCast: RayCast = get_node("FirstPersonCamera/InteractionRayCast")
onready var Avatar = get_node("Avatar")

var interaction_collider


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	
func _input(event):
	# Mouse Visibility
	if Input.is_action_just_pressed("toggle_cursor_capture"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Input.is_action_just_released("toggle_cursor_capture"):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	aim(event)


func _process(delta):
	process_interaction_raycast()


func _physics_process(delta):
	walk()
	apply_gravity()
	process_interaction_logic()


func aim(event: InputEvent) -> void:
	var mouse_motion := event as InputEventMouseMotion # := is an INFERRENCE rather than an ASSERTION
	if mouse_motion:
		rotation_degrees.y -= mouse_motion.relative.x * MOUSE_SENSITIVITY
		
		var current_tilt: float = FirstPersonCamera.rotation_degrees.x
		current_tilt -= mouse_motion.relative.y * MOUSE_SENSITIVITY
		
		FirstPersonCamera.rotation_degrees.x = clamp(current_tilt, -75, 75)


func walk() -> void:
	var movement_vector: Vector3
	
	move_and_slide(Vector3(
		transform.basis.x * Input.get_axis("move_left", "move_right") +	transform.basis.z * Input.get_axis("move_forward", "move_backward")
	) * WALK_SPEED, Vector3.UP, true, 4, 0.7853, false)


func apply_gravity() -> void:
	move_and_slide(Vector3.DOWN * GRAVITY, Vector3.UP, true, 4, 0.7853, false)


func process_interaction_raycast():
	InteractionRayCast.force_raycast_update()
	var collider = InteractionRayCast.get_collider()
	if collider != null:
		$CanvasLayer/HUD/InteractionTargetLabel.text = collider.name
	else:
		$CanvasLayer/HUD/InteractionTargetLabel.text = ""
	interaction_collider = collider


func process_interaction_logic():
	
	# Interaction Logic
#	if Input.is_action_just_pressed("interact"):
#		if interaction_collider:
#			if interaction_collider.is_in_group("damageable"):
#				interaction_collider.take_damage(ATTACK_DAMAGE)
#
#			if interaction_collider.is_in_group("interactable"):
#				interaction_collider.interact()
			
		interaction_collider = null

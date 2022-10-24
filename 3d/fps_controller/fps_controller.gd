extends KinematicBody

export var WALK_SPEED := 8
export var SPRINT_SPEED := 16
export var MOUSE_SENSITIVITY := 0.04
export var GRAVITY := 9.8
export var JUMP_HEIGHT := 128

onready var FirstPersonCamera: Camera = get_node("FirstPersonCamera")
onready var InteractionRayCast: RayCast = get_node("FirstPersonCamera/InteractionRayCast")
onready var Avatar = get_node("Avatar")
onready var GroundedArea: Area = get_node("GroundedArea")

var is_grounded: bool

var interaction_collider

var linear_velocity: Vector3 # Set each physics frame with the move_and_*() methods

var time_spent_falling: float

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	
func _input(event):
	# Mouse Visibility
	if Input.is_action_just_pressed("toggle_cursor_capture"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Input.is_action_just_released("toggle_cursor_capture"):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	aim(event as InputEventMouseMotion)


func _process(delta):
	process_interaction_raycast()


func _physics_process(delta):
	is_grounded = GroundedArea.get_overlapping_bodies().size() > 1
	walk(Input.is_action_pressed("sprint"))
	apply_gravity(delta)
	process_interaction_logic()
	jump(Input.is_action_just_pressed("jump"))


func aim(mouse_motion_event: InputEventMouseMotion) -> void:
	if not mouse_motion_event:
		pass
	else:
		rotation_degrees.y -= mouse_motion_event.relative.x * MOUSE_SENSITIVITY
		
		var current_tilt: float = FirstPersonCamera.rotation_degrees.x
		current_tilt -= mouse_motion_event.relative.y * MOUSE_SENSITIVITY
		
		FirstPersonCamera.rotation_degrees.x = clamp(current_tilt, -75, 75)

func walk(do_sprint: bool) -> void:
	var movement_vector: Vector3
	
	var movement_speed = SPRINT_SPEED if do_sprint else WALK_SPEED
	
	movement_vector = Vector3(transform.basis.x * Input.get_axis("move_left", "move_right") +	transform.basis.z * Input.get_axis("move_forward", "move_backward")).normalized()
	
	
	linear_velocity = move_and_slide(movement_vector * movement_speed, Vector3.UP, true, 4, 0.89, false)
	
	yield(get_tree().create_timer(1.0), "timeout")


func apply_gravity(delta: float) -> void:
	if is_grounded:
		time_spent_falling = 0.0
		pass
	else:
		linear_velocity = move_and_slide(Vector3.DOWN * GRAVITY * (time_spent_falling * 2), Vector3.UP, true, 4, 0.7853, false)
		time_spent_falling += delta


func jump(jump_input: bool):
	if jump_input:
		linear_velocity += move_and_slide(Vector3.UP * JUMP_HEIGHT, Vector3.UP)


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

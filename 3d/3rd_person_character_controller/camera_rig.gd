extends Spatial

export (NodePath) onready var FollowTarget = get_node(FollowTarget)

onready var MainCamera = $MainCamera

export (float) var sensitivity_scale = 0.0001
export (int, 1, 10) var sensitivity_factor = 7
onready var sensitivity = sensitivity_scale * sensitivity_factor

export (Vector3) var camera_offset = Vector3(0.0, 6.0, 25.0)

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if MainCamera:
		if event is InputEventMouseMotion:
			rotate_y(-event.relative.x * sensitivity)
			MainCamera.rotate_x(-event.relative.y * sensitivity)
		
			MainCamera.rotation_degrees.x = clamp(MainCamera.rotation_degrees.x + event.relative.y * sensitivity, -45.0, 15.0)

func _physics_process(delta):
	if MainCamera:
		if FollowTarget:
			self.global_transform.origin = FollowTarget.global_transform.origin
			MainCamera.fov = lerp(MainCamera.fov, 100 if FollowTarget.linear_velocity.length() > 20.0 else 80, 0.1 * delta)

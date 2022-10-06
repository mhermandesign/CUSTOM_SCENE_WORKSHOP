extends KinematicBody2D
var input_direction: Vector2
func _physics_process(delta):
	input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	if input_direction:
		$StateMachine.set_state($StateMachine/StateWalk)

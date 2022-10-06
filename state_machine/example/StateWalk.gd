# StateWalk.gd
extends State

func enter_state():
	print("Walking")
	owner = get_parent().get_parent()
	pass


func exit_state():
	pass
	
func state_process(delta: float):
	pass


func state_physics_process(delta: float):
	owner.move_and_slide(owner.input_direction * 64)	


func state_input(event):
	pass


func state_unhandled_input(event):
	pass

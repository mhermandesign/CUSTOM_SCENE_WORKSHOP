extends Node

class_name State


# Each node inheriting from State is responsible for implementing the following
# to allow for targeted behavior as needed.

func enter_state():
	# virtual
	pass
	
func exit_state():
	# virtual
	pass

func state_process(_delta: float):
	# virtual
	pass


func state_physics_process(_delta: float):
	# virtual
	pass


func state_input(event):
	# virtual
	pass


func state_unhandled_input(event):
	# virtual
	pass

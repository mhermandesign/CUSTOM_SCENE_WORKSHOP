# StateMachine.gd

extends Node
class_name StateMachine

# A simple, generic state manager that defers engine callbacks to whatever
# the _current_state thinks should happen. For example, Walk: State may
# choose to move an Avatar in the state_physics_process() method, while Idle: State
# is more likely to forgo that physics step entirely. 

# Possible states must be of type State and are to be direct children of any
# given StateMachine.

# NOTE: A StateMachine should NOT handle the logic for detecting state changes! 
# Defer that work to the parent or something.

export (NodePath) var INITIAL_STATE

onready var _current_state: State = get_node(INITIAL_STATE) setget set_state, get_state
var previous_state: State

func set_state(new_state):
	print("attempting to set state...")
	if get_children().has(new_state):
		print("setting state")
		previous_state = _current_state
		
		_current_state.exit_state()
		
		_current_state = new_state
		
		_current_state.enter_state()

func get_state():
	return _current_state

func _process(delta):
	_current_state.state_process(delta)
	
func _physics_process(delta):
	_current_state.state_physics_process(delta)

func _input(event):
	_current_state.state_input(event)
	
func _unhandled_input(event):
	_current_state.state_unhandled_input(event)

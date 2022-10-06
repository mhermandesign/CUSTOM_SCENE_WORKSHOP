extends State

func enter_state():
	print("Idling")
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

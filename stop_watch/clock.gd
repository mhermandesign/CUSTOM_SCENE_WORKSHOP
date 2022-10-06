# clock.gd
extends Control

# The possible modes the clock can be in
enum ClockModes { CLOCK, TIMER, STOPWATCH }

export (ClockModes) var clock_mode = ClockModes.CLOCK
export (int) var timer_start_value_in_seconds = 3

# The label used to display the Time
onready var TimeLabel = get_node("Panel/HBoxContainer/TimeLabel")


var start_time: int # set in start()
var current_time: int # set in _process() based on clock_mode
var paused: bool = true # toggled via pause_toggle()
var time_string: String # used by TimeLabel in _process()


func _process(delta):
	current_time = Time.get_unix_time_from_system()
	
	match clock_mode:
		ClockModes.CLOCK:
			print("I'm a clock")
			time_string = Time.get_datetime_string_from_datetime_dict(Time.get_date_dict_from_system(), true)
			
		ClockModes.TIMER:
			print("I'm a timer")
			if not paused:
				current_time = start_time - Time.get_ticks_msec()
				time_string = Time.get_time_string_from_unix_time(current_time)
				
		ClockModes.STOPWATCH:
			print("I'm a stopwatch")
			if not paused:
				current_time = start_time + Time.get_ticks_msec()
				time_string = Time.get_time_string_from_unix_time(current_time)
		_:
			push_error(name + "'s clock_mode property is invalid!")
	
	
	
	TimeLabel.text = time_string


func start():
	paused = false
	
	if clock_mode == ClockModes.STOPWATCH:
		start_time = 0
		
	if clock_mode == ClockModes.TIMER:
		start_time = timer_start_value_in_seconds


func stop():
	paused = true


func pause_toggle():
	paused = !paused


# Signals
func _on_ButtonStart_button_up():
	start()


func _on_ButtonStop_button_up():
	stop()


func _on_ButtonPause_button_up():
	pause_toggle()

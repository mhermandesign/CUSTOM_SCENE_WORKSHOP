# command_console.gd

extends Control

# A simple text input and feed console to allow for debug commands and the like.
# The 'commands' Array is filled with possible commands, and they all must have 
# an associated method to call when requested.



export (String) var feed_header = "Hello, user!"
export (Array) var commands = ["help", "quit", "clear"]



# NOTE: In the editor we can initially set an exported property to be a NodePath,
# and then, onready, allow the use of its current value (a NodePath) to be the
# argument for the get_node(path) method. One downside is that we don't get auto-
# completion with this method. That's actually kind of problematic, but I like
# how concise this method is so I'll stick with it here for now.

export (NodePath) onready var Feed = get_node(Feed)
export (NodePath) onready var InputField = get_node(InputField)
export (NodePath) onready var SubmitButton = get_node(SubmitButton)



# ======================= #
# ENGINE CALLBACKS
# ======================= #


func _unhandled_key_input(event):
	var keypress = event as InputEventKey
	
	match keypress.scancode:
			KEY_ENTER:
				_new_line(InputField.text)
				InputField.text = ""
				get_tree().set_input_as_handled()



# ======================= #
# CUSTOM METHODS
# ======================= #

func _new_line(new_text: String):
	# String sanitization stuff...
	var stripped_text = new_text.strip_edges()
	
	# TODO: This is kind of ugly, so find a better way to do this.
	Feed.text += "\n" + "> " + stripped_text
	
	if commands.has(stripped_text):
		var command = funcref(self, stripped_text)
		if command.is_valid():
			command.call_func()



# ======================= #
# COMMANDS
# ======================= #

# These must match the names in the commands: Array property
func help():
	_new_line(String(commands))

func quit():
	_new_line("quitting...")
	yield(get_tree().create_timer(0.3), "timeout")
	get_tree().quit()

func clear():
	Feed.text = ""



# ======================= #
# SIGNAL RESPONSES
# ======================= #

func _on_SubmitButton_button_up():
	pass # Replace with function body.

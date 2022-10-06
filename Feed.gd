extends TextEdit

func add_line(line: String):
	text += "\n" + line

func clear():
	yield(ConfirmationDialog.new(),"confirmed")
	text = ""

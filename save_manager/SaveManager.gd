# SaveManager.gd

extends Node

const DEFAULT_SAVE_PATH = "user://save/"

var _save_path = DEFAULT_SAVE_PATH

func _ready():
	# generate save data
	var dir = Directory.new()
	dir.open(_save_path)
	save_data({"test_data": 10}, "testdata.json")

func save_data(data, file_name):
	var dir = Directory.new()
	var file = File.new()
	var path = _save_path + file_name
	
	if not dir.dir_exists(path):
		dir.make_dir(path)
	print("saving data to " + path)
	
	var err_open = file.open(path, File.WRITE)
	if err_open:
		print("can't open")
		match err_open:
			ERR_FILE_NOT_FOUND:
				file.open(path, File.WRITE)
		
	print("storing data")
	file.store_var(data)
	
	print("closing")
	file.close()

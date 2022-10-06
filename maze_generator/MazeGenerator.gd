extends Spatial

func generate_maze():
	# Randomized depth-first search
	var stack = Array()
	var grid: Vector2 = Vector2(10, 10)
	for x in grid.x:
		for y in grid.y:
			print(String(x) + ", " + String(y))

func _ready():
	
	generate_maze()
	generate_maze()
	generate_maze()
	generate_maze()
	generate_maze()
	generate_maze()
	generate_maze()
	generate_maze()
	generate_maze()
	generate_maze()
	
	

extends Node

var teleport_areas = Array()
func _ready():
	# Append all children of type: Area to teleport_areas
	for child in get_children():
		var area: Area = child if child is Area else null
		if area:
			teleport_areas.append(area)
	
	for area in teleport_areas:
		
		print(area)

func teleport(target_node: Node, target_position):
		
	if target_node is Spatial and target_position is Vector3:
		(target_node as Spatial).transform.origin = target_position
		




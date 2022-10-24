extends Node

class_name Inventory

# An Inventory is comprised of its children (:Items), which can be added and
# removed as needed via method calls

func _ready():
	add_item(load("res://inventory/items/HealthPotion.tscn").instance())
	print(get_children())

func add_item(item: Item):
	print("adding item: " + item.item_name)
	add_child(item)
	
func remove_item(item: Item):
	if get_children().has(item):
		remove_child(item)
	

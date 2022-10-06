extends Node

class_name Item

# Meant to be a child of an Inventory. In-game items should be an instance of an Item
# eg., a HealthPotion: Item or a GoldenKey: Item.

enum ItemType { CONSUMABLE, GEAR, LOG, KEY }

export (String) var item_name: String = "Unnamed Item"
export (ItemType) var type = ItemType.CONSUMABLE
export (bool) var is_stackable: bool = false
export (String) var description: String = ""
export (Texture) var icon: Texture

func use():
	# virtual
	pass

# Godobot.gd

extends Node


func _ready():
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_ELASTIC)
	tween.tween_property($Sprite, "modulate", Color.red, 1)
	tween.tween_property($Sprite, "scale", Vector2(2,2), 3)
#	tween.tween_callback($Sprite, "queue_free")

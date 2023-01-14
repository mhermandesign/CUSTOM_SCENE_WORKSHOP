# pawn2d.gd

extends Area2D

func _ready():
	Navigation2DServer.agent_create()
	Navigation2DServer.map_get_agents(Navigation2DServer.get_maps()[0])

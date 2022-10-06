# lighting_rig.gd
extends Spatial

export (Array) var light_groups: Array = []

func new_light_group(lights: Array) -> Array:
	var new_group: Array = []
	for light in lights:
		if light is Light:
			lights.append(light)
	return new_group


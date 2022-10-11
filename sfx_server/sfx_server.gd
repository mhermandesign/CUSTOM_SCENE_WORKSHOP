# sfx_server.gd
# autoloaded - access as "SFXServer"
extends Node


# sfx_server spawns Audio: Spatial nodes where physics collisions occur. An AudioStream,
# local to the colliding bodies, will be passed to sfx_server via a signal emission
# or something. These AudioStreams could be mapped to a 2x2 matrix where each stream
# attributes to the final mixed AudioStream, which is played in global space, rather
# than being stuck to the objects themselves. The sfx player node thing will then
# just self-queue_free() on playback "timeout" and all will be well.

# NOTE 1: I'm thinking it might be best to use groups instead of audioclips local
# to the colliding bodies.

signal spawn_sfx(sfx_group_tags, position)

func _on_spawn_sfx(sfx_group_tags: Array, position: Vector3):
	print("spawning sfx")
	
	
	var sfx_stream_player = AudioStreamPlayer3D.new()
	sfx_stream_player.set("doppler_tracking", AudioStreamPlayer3D.DOPPLER_TRACKING_PHYSICS_STEP)
	
	
	sfx_stream_player.stream = preload("res://sfx_server/80-CC0-RPG-SFX/item_wood_01.ogg")
		
		
	get_tree().root.add_child(sfx_stream_player)
	sfx_stream_player.play()
	sfx_stream_player.global_transform.origin = position
	
	
#	yield(get_tree().create_timer(sfx_stream_player.stream.get_length()),"timeout")
#	sfx_stream_player.queue_free()


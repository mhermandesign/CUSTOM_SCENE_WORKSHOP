extends VBoxContainer

export (float) var update_wait_time = 1.0 # seconds

# TIME_FPS
# 

func _ready():
	$Timer.set("wait_time", update_wait_time)
	if not $Timer.autostart:
		$Timer.set("autostart", true)

func update_children():
	$FPSLabel.text = "FPS | " + String(Performance.get_monitor(Performance.TIME_FPS))
	$TimeProcessLabel.text = "Time Process | " + String(Performance.get_monitor(Performance.TIME_PROCESS))
	$TimePhysicsLabel.text = "Time Physics | " + String(Performance.get_monitor(Performance.TIME_PHYSICS_PROCESS))
	$RenderObjectsInFrameLabel.text = "Render Objects in Frame | " + String(Performance.get_monitor(Performance.RENDER_OBJECTS_IN_FRAME))
	
	

func _on_Timer_timeout():
	update_children()

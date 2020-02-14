extends Node

var goalTracker = ["a","b","c","d"]

func _ready():
	pass
	
func _process(delta):
	if Input.is_action_pressed("Reload"):
		
	#print(goalTracker)
		get_tree().reload_current_scene()
	#pass


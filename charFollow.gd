extends KinematicBody2D


var isFollowing = false

onready var sprite: Sprite = $Sprite
export var speed = 300;
var velocity = Vector2.ZERO;
var followDist = 150.0
var engageDist = 300
var getGot = false

func _ready():
	pass
#	connect("body_entered",self,"body_entered")
	
func body_entered(body):
	if body.name == "player":
		print("hit")


func followPlayer():
	var pos = get_node("../player").global_position 
	var target_global_position = pos
	velocity = Steering.follow(
		velocity,
		global_position,
		target_global_position,
		speed
	)
			
	velocity = move_and_slide(velocity) 
	sprite.rotation = velocity.angle()
	
	
func _process(delta):
	if get_name() in get_parent().goalTracker:
		pass
	else:
		queue_free()

func _physics_process(delta):
	if isFollowing == true:
		followPlayer()
	
	for body in $Hitbox.get_overlapping_bodies():
		if body.get_name() == "player":
			#print(body.hasCargo)
			if body.hasCargo == false:
				body.cargoName = get_name()
				isFollowing = true
				body.hasCargo = true
	#if get_name() in get_parent().goalTracker:
	#	get_parent().goalTracker.remove(get_name())
	#	print(get_parent().goalTracker)
	##if get_parent().name == "player":
	#if global_position.distance_to(get_node("../player").global_position) < engageDist:
#		var pos = get_node("../player").global_position #
	#	var target_global_position = pos
	#
	#	if global_position.distance_to(pos) < followDist: # not sure why the return works but it does
	#			return
	#	velocity = Steering.follow(
	#		velocity,
	#		global_position,
	#		target_global_position,
	#		speed
	#	)
	#		
	#	velocity = move_and_slide(velocity) 
	#	sprite.rotation = velocity.angle()

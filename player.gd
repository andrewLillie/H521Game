extends KinematicBody2D

export(int) var speed = 400
export(float) var rotation_speed = 3

var velocity = Vector2()
var rotation_dir = 0

var hasCargo = false;
var cargoName = "f";

func _physics_process(delta):
	#print(get_parent().goalTracker)
	input_V2()
	rotation += rotation_dir*rotation_speed*delta
	#dropoffLoop()
	move_and_slide(velocity)
	#print(hasCargo)
	if hasCargo == true:
		dropoffLoop()
	
	#var collision = move_and_collide(velocity)
	#print(collision)
	#if collision != null:
#		add_child(collision)
#		pass
		#if collision.get_collider() == ("c"):
	    #	print("i did the thing")


func dropoffLoop():
	for area in $Hitbox.get_overlapping_areas(): #takes hitbox, finds overlapping bodies and return a list
		var bodyName = area.get_name()
		if bodyName == "dump":
			hasCargo = false
			#print(get_parent().goalTracker)
			var cargoPos = get_parent().goalTracker.find(cargoName)
			get_parent().goalTracker.remove(cargoPos)
			
		
		
	
func input_V1():
	rotation_dir = 0
	velocity = Vector2()
	
	if Input.is_action_pressed("p1Up") && Input.is_action_pressed("p2Up"):
		velocity = Vector2(0,-speed).rotated(rotation)
	if Input.is_action_pressed("p1Up") && Input.is_action_pressed("p2Right"):
		rotation_dir += 1
	if Input.is_action_pressed("p1Right") && Input.is_action_pressed("p2Up"):
		rotation_dir += 1
	if Input.is_action_pressed("p1Up") && Input.is_action_pressed("p2Left"):
		rotation_dir -= 1
	if Input.is_action_pressed("p1Left") && Input.is_action_pressed("p2Up"):
		rotation_dir -= 1
	
	
func input_V2():
	
	rotation_dir = 0
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		rotation_dir += 1
	if Input.is_action_pressed("ui_left"):
		rotation_dir -= 1
	if Input.is_action_pressed("ui_down"):
		velocity = Vector2(0,speed).rotated(rotation)
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2(0,-speed).rotated(rotation)
		
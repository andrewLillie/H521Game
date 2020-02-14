extends Node

const DEFULT_MASS = 2.0
const DEFULT_MAX_SPEED = 400.0


static func follow(velocity: Vector2, global_pos: Vector2, target_pos: Vector2,max_speed = DEFULT_MAX_SPEED,mass = DEFULT_MASS) -> Vector2:
	var desired_vel = (target_pos - global_pos).normalized() * max_speed
	var steering = (desired_vel - velocity) / mass
	return velocity + steering

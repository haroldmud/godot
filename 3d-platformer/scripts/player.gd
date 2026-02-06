extends RigidBody3D

@export var engine_force := 40.0
@export var steering_speed := 1.5
@export var max_speed := 25.0

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _integrate_forces(state: PhysicsDirectBodyState3D) -> void:
	#var direction  =  Vector3.ZERO
	#direction.x = Input.get_axis("steer_left", "steer_right")
	#direction.z = Input.get_axis("move_forward", "move_backward")
	#
	#apply_central_force(direction * 1200.0 * delta)
	
	var forward_backward_input := Input.get_action_strength("move_forward") - Input.get_action_strength("move_backward")
	var steer_input := Input.get_action_strength("steer_right") - Input.get_action_strength("steer_left")
	
	if forward_backward_input < 0.0 :
		rotate_y(steer_input * steering_speed * state.step)
	elif forward_backward_input > 0.0 :
		rotate_y(-steer_input * steering_speed * state.step)
	
	var forward_direction = global_transform.basis.x
	apply_central_force(forward_direction * forward_backward_input * engine_force)
	
	if Input.is_action_just_pressed("ui_cancel"): # ESC key
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

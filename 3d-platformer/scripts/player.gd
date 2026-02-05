extends RigidBody3D

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _process(delta: float) -> void:
	var direction  =  Vector3.ZERO
	direction.x = Input.get_axis("steer_left", "steer_right")
	direction.z = Input.get_axis("move_forward", "move_backward")
	
	apply_central_force(direction * 1200.0 * delta)
	
	if Input.is_action_just_pressed("ui_cancel"): # ESC key
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

extends MeshInstance3D

var health := 6

func _ready() -> void:
	get_tree().call_group("ui", "set_health", health)

func _on_area_3d_body_entered(body: Node3D) -> void:
	print("a collision surely happened")
	if health > 0:
		health -= 1
		get_tree().call_group("ui", "set_health", health)
	elif health == 0:
		print("GAME OVER - race_track.gd")
	
	if body is RigidBody3D:
		body.linear_velocity = Vector3.ZERO
		body.global_position = body.global_position - body.transform.basis.x * 2

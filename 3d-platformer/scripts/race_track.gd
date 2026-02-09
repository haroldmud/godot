extends MeshInstance3D


func _on_area_3d_body_entered(body: Node3D) -> void:
	print("a collision surely happened")
	if body is RigidBody3D:
		body.linear_velocity = Vector3.ZERO
		body.global_position = body.global_position - body.transform.basis.x * 5

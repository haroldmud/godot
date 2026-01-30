extends Area2D

var SPEED := 500
var direction := Vector2.ZERO

func _process(delta: float) -> void:
	position += direction * SPEED * delta

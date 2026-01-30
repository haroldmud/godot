extends Area2D

var SPEED := 500
var direction := Vector2.UP

func _ready() -> void:
	direction = Vector2.UP.rotated(-rotation)
	rotation = deg_to_rad(-90)

func _process(delta: float) -> void:
	position += direction * SPEED * delta

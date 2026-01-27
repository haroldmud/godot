extends Area2D

const SPEED = 500.0  # Adjust this to control bullet speed
var direction := Vector2.UP  # Will be set when bullet is created

func _ready() -> void:
	# Get the direction based on the rotation when the bullet is spawned
	direction = Vector2.UP.rotated(-rotation)
	rotation = deg_to_rad(-90)
	if Input.is_action_just_pressed("bullet") and Input.is_action_just_pressed("move_left") and Input.is_action_just_pressed("shift"):
		rotation = deg_to_rad(-45)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * SPEED * delta

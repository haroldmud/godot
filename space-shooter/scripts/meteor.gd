extends Node2D

const SPEED = 1.0


var direction := Vector2.DOWN
@onready var meteor: Node2D = $"."
@onready var asteroid: Sprite2D = $Asteroid
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += Vector2(0, 1) * 50 * SPEED * delta
	asteroid.rotate(10.0 * delta)


func _on_body_entered(body: Node2D) -> void:
	print("the collision has happenned") # Replace with function body.

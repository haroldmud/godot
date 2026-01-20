extends Node

const SPEED = 84.0


var direction := Vector2.DOWN
@onready var asteroid: Sprite2D = $Asteroid
@onready var meteor: Node2D = $"."
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass 

extends Node

const SPEED = 64.0

var direction := Vector2.RIGHT

@onready var player: Node2D = $"."
@onready var meteor: Node2D = $"../Meteor"

# we won't need this since we already have teh @onready annotations.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input_direaction := Input.get_vector("move_left", "move_right", "move_forward", "move_backward") 

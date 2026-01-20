extends Node2D

const SPEED = 124.0

var direction := Vector2.RIGHT

@onready var player: Node2D = $"."
@onready var meteor: Node2D = $"../Meteor"

# we won't need this since we already have teh @onready annotations.
func _ready() -> void:
	position = Vector2(100, 200)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input_direction := Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	position += input_direction * SPEED * delta # the position is a built-in variable from the NODE2D
	keep_player_inside_screen()


func keep_player_inside_screen() -> void:
	var screen_size := get_viewport_rect().size
	var half_size: Vector2 = ($"PlayerImage".texture.get_size() * $"PlayerImage".scale) / 2
	
	position.x = clamp(position.x, half_size.x/4, screen_size.x - (half_size.x)/4)
	position.y = clamp(position.y, half_size.y/4, screen_size.y - (half_size.y)/4)
	print(half_size)
	

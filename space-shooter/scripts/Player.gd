extends Node2D

const SPEED = 124.0

var direction := Vector2.RIGHT
var scale_multiplier := 1.2
var scale_speed := 8.0
var original_scale: Vector2
@onready var player: Node2D = $"."
@onready var playerNode := $PlayerImage
# we won't need this since we already have teh @onready annotations.
func _ready() -> void:
	position = Vector2(580, 700)
	original_scale = playerNode.scale


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var target_scale: Vector2
	if Input.is_action_pressed("jump_over_meteor"):
		target_scale = original_scale * scale_multiplier
	else :
		target_scale = original_scale
		
	playerNode.scale = playerNode.scale.lerp(target_scale, scale_speed * delta)
	var input_direction := Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	position += input_direction * SPEED * delta # the position is a built-in variable from the NODE2D
	keep_player_inside_screen()


func keep_player_inside_screen() -> void:
	var screen_size := get_viewport_rect().size
	var half_size: Vector2 = (playerNode.texture.get_size() * playerNode.scale) / 2
	
	position.x = clamp(position.x, half_size.x/4, screen_size.x - (half_size.x)/4)
	position.y = clamp(position.y, half_size.y/4, screen_size.y - (half_size.y)/4)
	print(half_size)
	

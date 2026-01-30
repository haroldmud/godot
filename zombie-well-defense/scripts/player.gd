extends CharacterBody2D

var SPEED := 400
var rotation_speed := 8.0
var target_rotation = 0.0
var base_rotation := deg_to_rad(-90)
signal bullet(pos, rot)

func _ready() -> void:
	$MuzzleFlash.visible = false
	
func _process(delta: float) -> void:
	var input_direction  = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	position += input_direction * SPEED * delta
	if Input.is_action_pressed("shift") and Input.is_action_pressed("move_left"):
		target_rotation = deg_to_rad(-45)
	elif Input.is_action_pressed("shift") and Input.is_action_pressed("move_right"):
		target_rotation = deg_to_rad(45)
	else:
		target_rotation = 0.0
		
	if Input.is_action_just_pressed("ui_accept") and $PlayerImage.is_visible_in_tree():
		bullet.emit($BulletStartPos.global_position, rotation)
		$MuzzleFlash.visible = true
	else:
		$MuzzleFlash.visible = false

	rotation = lerp(rotation, base_rotation + target_rotation, rotation_speed * delta)
	keep_player_inside_screen()

func keep_player_inside_screen() -> void:
	var screen_size := get_viewport_rect().size
	var half_size: Vector2 = ($"PlayerImage".texture.get_size() * $"PlayerImage".scale) / 2
	position.x = clamp(position.x, half_size.x/4 , screen_size.x - half_size.x/4)
	position.y = clamp(position.y, half_size.y/4 , screen_size.y - half_size.y/4)

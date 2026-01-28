extends CharacterBody2D

const SPEED = 500.0

var direction := Vector2.RIGHT
var scale_multiplier := 1.2
var scale_speed := 8.0
var original_scale: Vector2
@onready var player: Node2D = $"."
@onready var playerNode := $PlayerImage
@onready var playerFailed := $PlayerImageFail
@onready var laser := $laser/LaserImage
@onready var laserBody :CollisionPolygon2D = $laser/CollisionPolygon2D
@onready var laserTimer :Timer = $LaserTimer
var can_shoot :bool = true
var init_shoot := 0
var target_rotation = 0.0
signal bullet(pos)

# we won't need this since we already have teh @onready annotations.
func _ready() -> void:
	position = Vector2(580, 700)
	original_scale = playerNode.scale
	laser.visible = false
	laserBody.disabled = true
	playerFailed.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var target_scale: Vector2		
	
	if Input.is_action_just_pressed("bullet") and can_shoot and init_shoot < 10:
		bullet.emit($BulletStartPosition.global_position)
		init_shoot +=1
		print(init_shoot)
		if init_shoot == 10:
			can_shoot = false
			$BulletTimer.start()
	
	
	if Input.is_action_pressed("jump_over_meteor"):
		target_scale = original_scale * scale_multiplier
	else :
		target_scale = original_scale
	
	if Input.is_action_just_pressed("ui_accept"):
		laser.visible = true
		turn_laser_on()
	else:
		laser.visible = false
	 
	playerNode.scale = playerNode.scale.lerp(target_scale, scale_speed * delta)
	var input_direction := Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	
	position += input_direction * SPEED * delta
	#velocity = input_direction * SPEED # the position is a built-in variable from the NODE2D
	#move_and_slide()
	keep_player_inside_screen()
	if Input.is_action_pressed("move_left") and Input.is_action_pressed("shift"):
		target_rotation = deg_to_rad(-45)
	elif Input.is_action_pressed("move_right") and Input.is_action_pressed("shift"):
		target_rotation = deg_to_rad(45)
	else:
		target_rotation = 0.0
	rotation = lerp(rotation, target_rotation, 8.0 * delta)
		

func turn_laser_on() -> void:
	laserBody.disabled = false
	laserTimer.start(0.2)

func _on_laser_timer_timeout() -> void:
	laserBody.disabled = true

func keep_player_inside_screen() -> void:
	var screen_size := get_viewport_rect().size

	var half_size: Vector2 = (playerNode.texture.get_size() * playerNode.scale) / 2
	position.x = clamp(position.x, half_size.x/4, screen_size.x - (half_size.x)/4)
	position.y = clamp(position.y, half_size.y/4, screen_size.y - (half_size.y)/4)
	


func _on_bullet_timer_timeout() -> void: # Turning on the One shot will ensure the operation to start over instead of going through a loop
	can_shoot = true
	init_shoot = 0

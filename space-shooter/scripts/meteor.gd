extends Node2D

var SPEED : float
var direction_x: float
var rotation_speed: float
#var direction := Vector2.DOWN
@onready var meteor: Node2D = $"."
@onready var asteroid: Sprite2D = $Asteroid
@onready var meteorCollider: CollisionShape2D = $CollisionShape2D
	
var backToNormal := true
var player_reference: Node2D = null
signal collision

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var rng = RandomNumberGenerator.new()
	
	var width = get_viewport_rect().size.x # to get the total width of the window
	var random_x = rng.randi_range(0, width) # the range from which the meteor should be generated on x
	var random_y = rng.randi_range(-15, -10) # the range from which the meteor shouuld generated above window on y axis
	position = Vector2(random_x, random_y)
	direction_x = rng.randi_range(-1, 1)
	rotation_speed  = rng.randi_range(1, 10)
	SPEED = rng.randi_range(100, 200)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += Vector2.DOWN *  SPEED * delta
	asteroid.rotate(rotation_speed * delta)
	position += Vector2(direction_x, 1)
	if collision_counter > 5:
		player_reference.visible = false

var collision_counter := 0
var scoring_collision := 0
func _on_body_entered(body: Node2D) -> void:
	collision.emit()
	body.rotation += 1.0
	backToNormal = false
	player_reference = body
	collision_counter += 1
	if body.has_node("PlayerImage") and body.has_node("PlayerImageFail") and backToNormal == false:
		body.get_node("PlayerImage").visible = false
		body.get_node("PlayerImageFail").visible = true
		print("normal___:", backToNormal)
		$MeteorCollisionTimer.start()

func _on_area_entered(_area: Area2D) -> void:
	asteroid.visible = false
	meteorCollider.set_deferred("disabled", true)
	scoring_collision += 1
	print(scoring_collision)

func _on_meteor_collision_timer_timeout() -> void:
	backToNormal = true
	print("about now normal:", backToNormal)
			  
	if player_reference.has_node("PlayerImage") and player_reference.has_node("PlayerImageFail") and backToNormal == true:
		player_reference.get_node("PlayerImage").visible = true
		player_reference.get_node("PlayerImageFail").visible = false

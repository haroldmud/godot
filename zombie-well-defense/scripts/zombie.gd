extends Area2D

var walk_time := 0.0
var walk_amount := deg_to_rad(5)
var walk_speed := 6.0
var SPEED : float

func _ready() -> void:
	var rng = RandomNumberGenerator.new()
	var width = get_viewport_rect().size.x
	var randomX = rng.randi_range(0, width)
	var randomY = rng.randi_range(-15, -130)
	position = Vector2(randomX, randomY)
	SPEED = rng.randf_range(100, 120)

func _process(delta: float) -> void:
	walk_time += delta
	rotation = sin(walk_time * walk_speed) * walk_amount
	position += Vector2.DOWN * delta * SPEED

func _on_body_entered(body: Node2D) -> void:
	if body.has_node("PlayerImage"):
		body.visible = false
	
	if body.has_node("WellImage"):
		print("the well has been contaminated")

func _on_area_entered(area: Area2D) -> void:
	$ZombieImage.visible = false
	$CollisionShape2D.set_deferred("disabled", true)
	area.visible = false

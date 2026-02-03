extends Area2D

var walk_time := 0.0
var walk_amount := deg_to_rad(5)
var walk_speed := 6.0
var SPEED : float
@export var target: StaticBody2D
var player_blood : Sprite2D
var deaths := 0
signal collision

func _ready() -> void:
	var rng = RandomNumberGenerator.new()
	var width = get_viewport_rect().size.x
	var randomX = rng.randi_range(0, width)
	var randomY = rng.randi_range(-15, -130)
	position = Vector2(randomX, randomY)
	SPEED = rng.randf_range(120, 150)
	$Blood.visible = false

func _process(delta: float) -> void:
	walk_time += delta
	if $Blood.is_visible_in_tree() == false and target:
		rotation = sin(walk_time * walk_speed) * walk_amount
		var direction = (target.global_position - global_position).normalized()
		global_position += direction * delta * SPEED

func _on_body_entered(body: Node2D) -> void:
	player_blood = body.get_node("Blood")
	if body.has_node("Blood"):
		body.get_node("Blood").visible = true
		body.global_position = -Vector2(0, 0)
		collision.emit()
	
	if body.has_node("WellImage"):
		get_tree().change_scene_to_file("res://game_over.tscn")

func _on_area_entered(area: Area2D) -> void:
	$ZombieImage.visible = false
	$Blood.visible = true
	$CollisionShape2D.set_deferred("disabled", true)
	area.visible = false
	get_tree().call_group("ui", "set_score_per_killed_zombie", 1)

func _on_blood_timer_timeout() -> void:
	$Blood.visible = false
	if player_blood:
		player_blood.visible = false
	player_blood = null
	

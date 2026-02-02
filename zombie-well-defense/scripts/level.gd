extends Node2D

var zombie_scene: PackedScene = load("res://scenes/zombie.tscn")
var bullet_scene: PackedScene = load("res://scenes/bullet.tscn")
var zombie_size := Vector2(148, 148)
@export var well:= StaticBody2D
var health := 5

func _ready():
	get_tree().call_group("ui", "set_health", health)

func _on_zombies_spawn_timer_timeout() -> void:
	var zombie = zombie_scene.instantiate()
	var sprite := zombie.get_node("ZombieImage")
	var og_size = sprite.texture.get_size()
	zombie.scale = zombie_size / og_size
	var screen_width = get_viewport_rect().size.x
	zombie.global_position = Vector2(randf_range(0, screen_width), -100)
	zombie.target = well
	$Zombies.add_child(zombie)
	zombie.connect("collision", _on_zombie_collision)

func _on_player_bullet(pos: Variant, rot: Variant) -> void:
	var bullet = bullet_scene.instantiate()
	bullet.rotation = rot
	bullet.direction = Vector2.UP.rotated(rot - deg_to_rad(-95))
	bullet.position = pos
	$bullets.add_child(bullet)

func _on_zombie_collision() -> void:
	if health > 0:
		health -= 1
		get_tree().call_group("ui", "set_health", health)
	elif health < 1:
		get_tree().change_scene_to_file("res://game_over.tscn")

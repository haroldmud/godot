extends Node2D

var zombie_scene: PackedScene = load("res://scenes/zombie.tscn")
var bullet_scene: PackedScene = load("res://scenes/bullet.tscn")
var zombie_size := Vector2(148, 148)
@export var well:= StaticBody2D

func _on_zombies_spawn_timer_timeout() -> void:
	var zombie = zombie_scene.instantiate()
	var sprite := zombie.get_node("ZombieImage")
	var og_size = sprite.texture.get_size()
	zombie.scale = zombie_size / og_size
	var screen_width = get_viewport_rect().size.x
	zombie.global_position = Vector2(randf_range(0, screen_width), -100)
	
	# Set target to follow
	zombie.target = well
	
	$Zombies.add_child(zombie)

func _on_player_bullet(pos: Variant, rot: Variant) -> void:
	var bullet = bullet_scene.instantiate()
	bullet.rotation = rot
	bullet.direction = Vector2.UP.rotated(rot - deg_to_rad(-95))
	bullet.position = pos
	$bullets.add_child(bullet)

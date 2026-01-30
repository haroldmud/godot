extends Node2D

var zombie_scene: PackedScene = load("res://zombie-well-defense/scenes/zombie.tscn")
var bullet_scene: PackedScene = load("res://zombie-well-defense/scenes/bullet.tscn")
var target_size := Vector2(148, 148)

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	pass

func _on_zombies_spawn_timer_timeout() -> void:
	var zombie = zombie_scene.instantiate()
	var sprite := zombie.get_node("ZombieImage")
	var og_size = sprite.texture.get_size()
	zombie.scale = target_size / og_size
	$Zombies.add_child(zombie)


func _on_player_bullet(pos: Variant) -> void:
	var bullet = bullet_scene.instantiate()
	$bullets.add_child(bullet)
	bullet.position = pos

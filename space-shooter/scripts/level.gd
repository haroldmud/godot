extends Node2D

var meteor_scene: PackedScene = load("res://scenes/meteor.tscn")
var bullet_scene: PackedScene = load("res://scenes/bullet.tscn")

func _on_meteor_timer_timeout() -> void:
	var meteor = meteor_scene.instantiate()
	$meteors.add_child(meteor)

func _on_player_bullet(pos) -> void:
	var bullet = bullet_scene.instantiate()
	bullet.rotation = -$Player.rotation
	$bullets.add_child(bullet)
	bullet.position = pos

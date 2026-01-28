extends Node2D

var meteor_scene: PackedScene = load("res://scenes/meteor.tscn")
var bullet_scene: PackedScene = load("res://scenes/bullet.tscn")
var health  := 5

func _on_meteor_timer_timeout() -> void:
	var meteor = meteor_scene.instantiate()
	$meteors.add_child(meteor)
	meteor.connect("collision", _on_meteor_collision)

func _on_player_bullet(pos) -> void:
	var bullet = bullet_scene.instantiate()
	bullet.rotation = -$Player.rotation
	$bullets.add_child(bullet)
	bullet.position = pos

func _on_meteor_collision() -> void:
	if health > 0:
		health -= 1
		get_tree().call_group('ui', 'SSt_health', health)
	elif health == 0:
		print("the player should die at this point")
		

extends Node2D

var meteor_instance: PackedScene = load("res://scenes/meteor.tscn")
func _on_meteor_timer_timeout() -> void:
	var meteor = meteor_instance.instantiate()
	$meteors.add_child(meteor)

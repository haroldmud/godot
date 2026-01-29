extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var TWEEN = create_tween()
	TWEEN.tween_property($LaserImage, "scale", Vector2(1,1), 0.2).from(Vector2(0,0))
	


func _on_game_over_timer_timeout() -> void:
	pass # Replace with function body.

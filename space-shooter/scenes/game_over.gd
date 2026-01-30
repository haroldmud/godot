extends Control

<<<<<<< HEAD

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://scenes/level.tscn")
=======
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$CenterContainer/VBoxContainer/yourScore.text= "YOUR SCORE: " + str(Global.score)
	
>>>>>>> eb11e0626066b840e061e71bea9a6af7601702b6

extends Control

# Called when the node enters the scene tree for the first time.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://scenes/level.tscn")

	$CenterContainer/VBoxContainer/score.text = "YOUR SCORE: " + str(Global.score)
	if Global.is_well_contaminated:
		$CenterContainer/VBoxContainer/well.text = "the well was contaminated"
	else:
		$CenterContainer/VBoxContainer/well.text = "You died"

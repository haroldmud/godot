extends CanvasLayer

var score:= 0

func set_health(health_amount):
	for child in $HBoxContainer.get_children():
		child.queue_free()
	for life in health_amount:
		var image = TextureRect.new()
		image.texture = load("res://zombie-survival/icons/love-always-wins.png")
		$HBoxContainer.add_child(image)

func set_score_per_killed_zombie(killed_zombie :=1):
	score += killed_zombie
	$score.text = "000" + str(score)

func _on_score_timer_timeout() -> void:
	score += 5
	Global.score = score
	print("the score is ", Global.score)

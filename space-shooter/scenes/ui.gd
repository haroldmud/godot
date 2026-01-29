extends CanvasLayer

var timeElapsed := 0
var score := 0
var total_score
func set_health(health_amount):
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()
	for i in health_amount:
		var text_rect = TextureRect.new()
		text_rect.texture = load("res://graphics/other/icons/love-always-wins.png")
		$MarginContainer2/HBoxContainer.add_child(text_rect)
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP

func set_score(score_value := 1):
	score += score_value


func _on_score_timer_timeout() -> void:
	timeElapsed += 1
	


func _on_total_score_timer_timeout() -> void:
	total_score = timeElapsed + score
	$MarginContainer/Label.text = str(total_score)

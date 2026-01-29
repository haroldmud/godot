extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func set_health(health_amount):
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()
	for i in health_amount:
		var text_rect = TextureRect.new()
		text_rect.texture = load("res://graphics/other/icons/love-always-wins.png")
		$MarginContainer2/HBoxContainer.add_child(text_rect)
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP

extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$LaserImage.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		$LaserImage.visible = true
	else:
		$LaserImage.visible = false

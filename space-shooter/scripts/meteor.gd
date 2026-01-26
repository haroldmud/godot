extends Node2D

var SPEED : float
var direction_x: float
var rotation_speed: float
#var direction := Vector2.DOWN
@onready var meteor: Node2D = $"."
@onready var asteroid: Sprite2D = $Asteroid
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var rng = RandomNumberGenerator.new()
	
	var width = get_viewport_rect().size.x # to get the total width of the window
	var random_x = rng.randi_range(0, width) # the range from which the meteor should be generated on x
	var random_y = rng.randi_range(-15, -10) # the range from which the meteor shouuld generated above window on y axis
	position = Vector2(random_x, random_y)
	direction_x = rng.randi_range(-1, 1)
	rotation_speed  = rng.randi_range(1, 10)
	SPEED = rng.randi_range(100, 200)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += Vector2.DOWN *  SPEED * delta
	asteroid.rotate(rotation_speed * delta)
	position += Vector2(direction_x, 1)



func _on_body_entered(body: Node2D) -> void:
	print("the collision has happenned") # Replace with function body.
	body.rotation += 2.0 


func _on_area_entered(area: Area2D) -> void:
	print("the laser has been shot")
	asteroid.visible = false

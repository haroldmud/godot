extends Sprite2D

# initialize the types of asteroids
var asteroid_textures = [
	preload("res://graphics/meteors/asteroid.png"),
	preload("res://graphics/meteors/stony-iron-asteroid.png"),
	preload("res://graphics/meteors/mars-asteroid.png")
]

# the size they should all have
var target_size = Vector2(64, 64)

func _ready() -> void:
	randomize() # makes randomness different every run
	# this is to randomly pick an asteroid at every run
	texture = asteroid_textures[randi() % asteroid_textures.size()]
	
	# this is to make sure the size of those different asteroids are the same
	if texture:
		scale = target_size / texture.get_size()

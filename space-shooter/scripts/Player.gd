extends Node

const SPEED = 64.0

var direction := Vector2.RIGHT

@export var game_player: Node2D

@onready var meteor := me


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass 

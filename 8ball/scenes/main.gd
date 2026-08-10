extends Node


@export var ball_scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_game()

func new_game()->void:
	generate_balls()
	
func generate_balls()->void:
	var rows : int = 5
	# diameter
	var dia = 36
	for col in range(5):
		for row in range(rows):
			var b : RigidBody2D = ball_scene.instantiate()
			var pos = Vector2( 250 + (col * (dia)), 267 + (row * (dia)) + (col*dia/2) )
			add_child(b)
			b.position = pos
			b.get_node("Sprite2D").texture = load("res://assets/ball_1.png")
		rows -= 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

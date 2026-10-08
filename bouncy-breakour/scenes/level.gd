class_name Level
extends Node2D

func _ready() -> void:
	for row in range(20, 100, 10):
		for brick in range(20, 200, 20):
			var brick_blueprint : PackedScene = preload("uid://d228l6in2ubmc")
			var new_brick := brick_blueprint.instantiate()
			new_brick.position = Vector2(brick, row)
			add_child(new_brick)

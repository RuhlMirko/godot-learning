class_name Level
extends Node2D

var brick_blueprint : PackedScene = preload("uid://d228l6in2ubmc")

var level : Array[String] = [
	"OOOOOOOOO",
	"OOOOOOOOO",
	"OOOOOOOOO",
	"OOOOOOOOO",
	"OOOOOOOOO",
	"OOOOOOOOO",
	"OOOOOOOOO",
	"OOOOOOOOO"
]

func _ready() -> void:
	var n_cols : int = 9
	var n_rows : int = 8
	var top_left: Vector2 = Vector2(20, 20)
	
	for row in n_rows:
		for col in n_cols:
			if level[row][col] == "O":
				var new_brick := brick_blueprint.instantiate()
				new_brick.position = top_left + Vector2(20 * col, 10 * row)
				add_child(new_brick)

class_name Level
extends Node2D

var brick_blueprint : PackedScene = preload("uid://d228l6in2ubmc")
var hard_brick_bp : PackedScene = preload("uid://ckh2eanso6k7x")

var level : Array[String] = [
	"OOOHOOO O",
	"OHOOOOOOO",
	"OOOO  OOO",
	"OOOOHOOOO",
	"OO OOOO O",
	"O  OOOOOO",
	"OOHOOOOOO",
	"OHOOOOHOO"
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
			if level[row][col] == "H":
				var new_brick := hard_brick_bp.instantiate()
				new_brick.position = top_left + Vector2(20 * col, 10 * row)
				add_child(new_brick)

class_name Level
extends Node2D

var brick_blueprint : PackedScene = preload("uid://d228l6in2ubmc")
var hard_brick_bp : PackedScene = preload("uid://ckh2eanso6k7x")
var tnt_brick_bp : PackedScene = preload("uid://tfk14wbigaq2")

var level : Array[String] = [
	"OOOHOOO O",
	"OHOOTOOOO",
	"OOOO  OOO",
	"OTOOHOOTO",
	"OO OOOO O",
	"O  OOTOOO",
	"OOHOOOOOO",
	"OHOOOOHOO"
]

func _ready() -> void:
	var n_cols : int = 9
	var n_rows : int = 8
	var top_left: Vector2 = Vector2(20, 20)
	
	for row in n_rows:
		for col in n_cols:
			var new_brick : Brick = null
			if level[row][col] == "O":
				new_brick = brick_blueprint.instantiate()
			elif level[row][col] == "H":
				new_brick = hard_brick_bp.instantiate()
			elif level[row][col] == "T":
				new_brick = tnt_brick_bp.instantiate()
			if new_brick != null:
				new_brick.position = top_left + Vector2(20 * col, 10 * row)
				add_child(new_brick)

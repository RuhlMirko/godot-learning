class_name Level
extends Node2D

signal cleared
signal spawn_new_ball(amount:int, pos:Vector2)

var brick_blueprint : PackedScene = preload("uid://d228l6in2ubmc")
var hard_brick_bp : PackedScene = preload("uid://ckh2eanso6k7x")
var tnt_brick_bp : PackedScene = preload("uid://tfk14wbigaq2")
var spawner_brick_bp : PackedScene = preload("uid://rn4dnj1krsi2")
var total_bricks : int = 0
var score : int = 0

var level : Array[String] = [
	"OTOHOSO O",
	"OHTOTOOTO",
	"OTOO  OTO",
	"OTOOHOOTO",
	"OO TOOO O",
	"O  OOTSOO",
	"OOHTOOOTO",
	"OHOTOSHOO"
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
			elif level[row][col] == "S":
				new_brick = spawner_brick_bp.instantiate()
			if new_brick != null:
				new_brick.position = top_left + Vector2(20 * col, 10 * row)
				new_brick.brick_died.connect(update_score)
				add_child(new_brick)
				total_bricks += 1

func update_score(brick: Brick):
	total_bricks -= 1
	score += brick.points
	$"../ScoreLabel".text = str(score)
	if brick.balls_spawned > 0:
		spawn_new_ball.emit(brick.balls_spawned, brick.position)
	if total_bricks == 0:
		cleared.emit()

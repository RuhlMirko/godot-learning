class_name Level
extends Node2D

signal cleared
signal points_scored(amount: int)
signal spawn_requested(amount: int, spawn_position: Vector2)

var brick_blueprint := preload("res://bricks/brick.tscn")
var bombbrick_blueprint := preload("res://bricks/bomb_brick.tscn")
var hardbrick_blueprint := preload("res://bricks/hard_brick.tscn")
var spawnbrick_blueprint := preload("res://bricks/spawn_brick.tscn")
#var expand_blueprint := 
var speed_brick_blueprint := preload("uid://b4671ejrprayu")

var nb_bricks_left := 0

var levels : Array[Array] = [
	[
	"0B0000000",
	"0000X 000",
	"0B 00B000",
	" 0B000+00",
	"00H000 00", 
	"000X00H00",
	"000H0B000",
	"0+00B00B0",]
	,
	[
	"0B0B000B0",
	"0000B+000",
	"0BH00B000",
	"H0B000+00",
	"00H00HBH+", 
	"0H0 00BH0",
	"000H0BH0H",
	"0+00B0HBH",
	],
	[
	"0B0H0HHH0",
	"0000HB00H",
	"0B+00B000",
	"+0B000+00",
	"00H0+0H0H", 
	"000+00H00",
	"000H0B00H",
	"0+0HB0HB0",
	]
	 ]

func _ready() -> void:
	load_next_level()

var curr_level : = -1

func has_next_level()->bool:
	return curr_level < levels.size()

func load_next_level()->void:
	if has_next_level():
		curr_level += 1
		var level : Array = levels[curr_level]
		var nb_rows := 8
		var nb_cols := 9
		var top_left := Vector2(20, 20)
		for y in nb_rows:
			for x in nb_cols:
				var brick : Brick = null
				if level[y][x] == "0":
					brick = brick_blueprint.instantiate()
				elif level[y][x] == "H":
					brick = hardbrick_blueprint.instantiate()
				elif level[y][x] == "B":
					brick = bombbrick_blueprint.instantiate()
				elif level[y][x] == "+":
					brick = spawnbrick_blueprint.instantiate()
				elif level[y][x] == "S":
					brick = speed_brick_blueprint.instantiate()
				#elif level[y][x] == "X":
					#brick = expand_blueprint.instantiate()
				if brick != null:
					nb_bricks_left += 1
					brick.destroyed.connect(on_brick_destroyed)
					brick.position = top_left + Vector2(20 * x, 10 * y)
					add_child(brick)
				
func on_brick_destroyed(brick: Brick) -> void:
	nb_bricks_left -= 1
	points_scored.emit(brick.points)
	if brick.balls_spawned > 0:
		spawn_requested.emit(brick.balls_spawned, brick.position)
	if nb_bricks_left == 0:
		cleared.emit()

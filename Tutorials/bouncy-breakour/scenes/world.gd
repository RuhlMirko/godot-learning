class_name World
extends Node2D

var ball_bp : PackedScene = preload("uid://sd0nlh2c3hw0")
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var ball_counter : int = 0

func _ready() -> void:
	make_new_ball()

func _on_out_bounds_body_entered(ball: Node2D) -> void:
	ball.queue_free()
	ball_counter -= 1 
	if ball_counter == 0:
		animation_player.play("lose")

func make_new_ball():
	var new_ball : Ball = ball_bp.instantiate()
	new_ball.paddle = $Paddle
	add_child(new_ball)


func _on_level_cleared() -> void:
	animation_player.play("level_clear")
	

func _on_level_spawn_new_ball(amount: int, pos: Vector2) -> void:
	for i in amount:
		spawn_ball(pos)

func spawn_ball(pos):
	var new_ball : Ball = ball_bp.instantiate()
	new_ball.paddle = $Paddle
	add_child(new_ball)
	new_ball.launch(pos)
	ball_counter += 1

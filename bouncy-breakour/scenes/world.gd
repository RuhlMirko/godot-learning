class_name World
extends Node2D

var ball_bp : PackedScene = preload("uid://sd0nlh2c3hw0")
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_out_bounds_body_entered(ball: Node2D) -> void:
	ball.queue_free()
	animation_player.play("lose")

func make_new_ball():
	var new_ball : Ball = ball_bp.instantiate()
	new_ball.paddle = $Paddle
	add_child(new_ball)

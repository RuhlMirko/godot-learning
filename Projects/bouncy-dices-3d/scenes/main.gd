
extends Node

const GAME_SCENE = preload("uid://b4tl3ajq62es1")

var current_game: Node = null

func _ready():
	start_new_game()

func start_new_game():
	if is_instance_valid(current_game):
		current_game.queue_free()
	current_game = GAME_SCENE.instantiate()
	current_game.restart_game.connect(start_new_game)
	add_child(current_game)

extends Node

const GAME = preload("uid://cmvi8rt67bmrw")
const MAIN = preload("uid://cg0767yigyres")

func load_game_screen()->void:
	get_tree().change_scene_to_packed(GAME)

func load_main_screen()->void:
	get_tree().change_scene_to_packed(MAIN)

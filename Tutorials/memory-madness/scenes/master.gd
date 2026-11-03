extends Control

@onready var main: Control = $Main
@onready var game: Control = $Game

func _ready() -> void:
	SignalHub.on_level_selected.connect(on_level_selected)
	SignalHub.game_exit.connect(exit_game)
	show_game(false)

func on_level_selected(level_setting: LevelSetting) -> void:
	show_game(true)
	
func exit_game()->void:
	show_game(false)
	
func show_game(is_shown: bool)->void:
	main.visible = !is_shown
	game.visible = is_shown

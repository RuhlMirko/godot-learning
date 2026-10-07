extends Node

signal on_level_selected(level_setting: LevelSetting)
signal game_exit

func emit_on_level_selected(level_setting: LevelSetting) -> void:
	on_level_selected.emit(level_setting)

func on_game_exit_pressed() -> void:
	game_exit.emit()

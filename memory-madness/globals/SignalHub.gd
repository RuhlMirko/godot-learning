extends Node

signal on_level_selected(level_setting: LevelSetting)
signal on_level_exit

func emit_on_level_selected(level_setting: LevelSetting) -> void:
	on_level_selected.emit(level_setting)

func emit_on_level_exit() -> void:
	on_level_exit.emit()

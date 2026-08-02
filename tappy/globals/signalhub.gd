extends Node

signal tappy_died

func emit_tappy_died()->void:
	tappy_died.emit()

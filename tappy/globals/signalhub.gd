extends Node

signal tappy_died
signal scored

func emit_tappy_died()->void:
	tappy_died.emit()

func scored_gate()->void:
	scored.emit()

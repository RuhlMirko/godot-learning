extends Node

signal tappy_died
signal scored(score:int)

func emit_tappy_died()->void:
	tappy_died.emit()

func scored_gate(score:int)->void:
	scored.emit(score)

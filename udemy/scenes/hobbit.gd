class_name Hobbit
extends Node2D

signal hobbit_spell

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("hit_wizard"):
		hobbit_spell.emit()

func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate(PI * delta)


func hit_by_spell()->void:
	scale = Vector2(0.5,0.5)
	rotation = 0
	set_process(false)

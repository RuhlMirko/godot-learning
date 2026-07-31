class_name Hobbit
extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate(10 * delta)


func _on_timer_timeout() -> void:
	hide()

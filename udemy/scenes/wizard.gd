extends Node2D
class_name Wizard


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_spell_timer_timeout() -> void:
	print("Spell was cast")


func _on_reveal_timer_timeout() -> void:
	show()

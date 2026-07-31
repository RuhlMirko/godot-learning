extends Node2D
class_name Wizard

signal cast_spell

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_spell_timer_timeout() -> void:
	print("Spell was cast")
	cast_spell.emit()


func _on_reveal_timer_timeout() -> void:
	show()

func hit_by_spell()->void:
	scale = Vector2(0.5,0.5)
	set_process(false)

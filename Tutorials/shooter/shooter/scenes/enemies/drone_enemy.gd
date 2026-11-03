extends CharacterBody2D

func _process(delta: float) -> void:
	var direction = Vector2.RIGHT
	velocity = direction * 100
	move_and_slide()

func hit()-> void:
	modulate.a = 0.5
	

extends Area2D

@export var speed : int = 1000

func _process(delta: float) -> void:
	var direction : Vector2 = Vector2.UP
	#transform.x += 1 * speed
	position += direction * speed * delta

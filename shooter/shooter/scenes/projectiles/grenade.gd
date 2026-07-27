extends RigidBody2D

@export var speed : int = 500

func _process(delta: float) -> void:
	var direction : Vector2 = Vector2.UP
	position += direction * speed * delta

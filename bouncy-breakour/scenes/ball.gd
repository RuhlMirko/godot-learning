extends CharacterBody2D

@export var speed := 100.0

func _ready() -> void:
	var direction := Vector2(randf_range(-1,1), -1).normalized()
	velocity = direction * speed
	

func _physics_process(delta: float) -> void:
	var collision:= move_and_collide(velocity * delta)
	if position.y >=200:
		queue_free()
	if collision != null:
		velocity = velocity.bounce(collision.get_normal())
	

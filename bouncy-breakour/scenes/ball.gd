extends CharacterBody2D

var gravity : float= 200.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity.y = gravity
	#move_and_slide()
	#move_and_collide()

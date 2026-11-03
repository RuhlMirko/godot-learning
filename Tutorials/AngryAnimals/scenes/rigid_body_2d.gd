extends RigidBody2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("break"):
		#linear_velocity += Vector2(-600, 0)
		transform.x += Vector2(-600, 0) 

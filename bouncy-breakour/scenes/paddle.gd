extends AnimatableBody2D



func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	position.x = clamp(get_global_mouse_position().x, 17, 183)
	print(delta)

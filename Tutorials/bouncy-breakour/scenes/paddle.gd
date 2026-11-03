class_name Paddle
extends AnimatableBody2D

const ACCELERATION = 10.0
const MAX_SPEED = 100.0

var velocity = Vector2.ZERO

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	var target_x = get_global_mouse_position().x
	var clamped_target = clamp(target_x, 17, 183)
	var direction = (clamped_target - position.x)
	velocity.x = move_toward(velocity.x, direction * ACCELERATION, MAX_SPEED)
	position.x += velocity.x * delta

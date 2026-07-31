extends Area2D
class_name Dice

@onready var sprite_2d: Sprite2D = $Sprite2D

const MAX_SPEED : float = 200.0
var random_spin_speed: float = randf_range(50.0, MAX_SPEED)
const rotation_speed : float = 14.0

func _physics_process(delta: float) -> void:
	position.y += random_spin_speed * delta
	sprite_2d.rotate((random_spin_speed / rotation_speed ) * delta)

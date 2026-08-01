extends Area2D
class_name Dice

signal game_over

@onready var sprite_2d: Sprite2D = $Sprite2D

const MAX_SPEED : float = 150.0
const WHITESPACE: float = 60.0
var random_spin_speed: float = randf_range(50.0, MAX_SPEED)
const rotation_speed : float = 14.0


func _ready() -> void:
	position.x = randf_range(
		WHITESPACE + get_viewport_rect().position.x, 
		get_viewport_rect().end.x - WHITESPACE
		) 
	position.y = -150.0

func _physics_process(delta: float) -> void:
	position.y += random_spin_speed * delta
	sprite_2d.rotate((random_spin_speed / rotation_speed ) * delta)
	check_off_screen()

func check_off_screen()->void:
	if get_viewport_rect().end.y < position.y:
		get_tree().paused = true
		game_over.emit()
		queue_free()

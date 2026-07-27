extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

@export var speed: float = 50.0
@export var facing_degree := 90.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#rotate_path()
	#velocity = transform.x * speed
	#move_and_slide()
	position.x += 6 * speed * delta

func rotate_path():
	facing_degree = randf_range(0.0, 20.0)
	rotation_degrees = facing_degree

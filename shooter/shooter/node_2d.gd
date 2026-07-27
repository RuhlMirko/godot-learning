extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

@export var speed: float = 100.0
@export var facing_degree := 90.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#facing_degree = randf_range(facing_degree, 180.0)
	#rotation_degrees = facing_degree
	#print(facing_degree)
	velocity = transform.x * speed
	move_and_slide()

extends Area2D

@export var speed : float = 300.0
@onready var sprite_2d: Sprite2D = $Sprite2D

func _process(delta: float) -> void:
	var move : float = Input.get_axis("left","right")
	
	if !is_zero_approx(move):
		sprite_2d.flip_h = move >= 0.0
	
	position.x += speed * delta * move
	

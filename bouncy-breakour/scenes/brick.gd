class_name Brick
extends StaticBody2D

@export var health : int

func take_damage()->void:
	health -= 1
	$Sprite.frame += 1
	if health<=0:
		queue_free()

class_name Brick
extends StaticBody2D

@onready var sprite: Sprite2D = $Sprite
var health : int

func _ready() -> void:
	health =  sprite.get_vframes()

func take_damage()->void:
	health -= 1
	if health<=0:
		queue_free()
	sprite.frame += 1

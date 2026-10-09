class_name Brick
extends StaticBody2D

@onready var sprite: Sprite2D = $Sprite
@onready var explosion_radius: Area2D = $ExplosionRadius
var health : int

func _ready() -> void:
	health =  sprite.get_vframes()

func take_damage()->void:
	health -= 1
	if health<=0:
		queue_free()
		explode()
	sprite.frame += 1

func explode()->void:
	var targets = explosion_radius.get_overlapping_bodies()
	for item in targets:
		if item is not Ball:
			item.queue_free()

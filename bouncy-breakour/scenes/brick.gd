class_name Brick
extends StaticBody2D

@onready var sprite: Sprite2D = $Sprite
@onready var explosion_radius: Area2D = $ExplosionRadius
var health : int
var is_dying : bool = false

func _ready() -> void:
	health =  sprite.get_vframes()

func take_damage()->void:
	if !is_dying:
		health -= 1
		if health >0:
			sprite.frame += 1
		else:
			is_dying = true
			queue_free()
			explode()
		

func explode()->void:
	var targets : Array[Node2D] = explosion_radius.get_overlapping_bodies()
	for item in targets:
		if item is Brick and item != self:
			var brick : Brick = item
			brick.take_damage()

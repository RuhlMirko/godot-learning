extends CharacterBody2D

const MOB_SPEED = 300.0

@onready var player = $"../../Player"

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * MOB_SPEED
	move_and_slide()

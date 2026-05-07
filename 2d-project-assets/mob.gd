extends CharacterBody2D

const MOB_SPEED = 300.0
var base_health = randf_range(20, 100)

@onready var player = $"../../Player"

func _ready():
	%Slime.play_walk()

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * MOB_SPEED
	move_and_slide()
	
func take_damage()->void:
	%Slime.play_hurt()
	base_health -= 20	
	if base_health <= 0:
		queue_free()
		
		const SMOKE_EXPLOSION = preload("uid://dhmhmrth6rdce")
		var smoke = SMOKE_EXPLOSION.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
	

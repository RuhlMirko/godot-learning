extends CharacterBody2D

signal health_depleted

const BASE_SPEED : int= 600
const BASE_HEALTH : float = 100.0
var curr_health: float = BASE_HEALTH
const DAMAGE_RATE: float = 25.0


func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * BASE_SPEED
	move_and_slide()
	
	if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()	
	
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size()>0:
		curr_health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = curr_health
		
		if curr_health <= 0.0:
			health_depleted.emit()
			
	

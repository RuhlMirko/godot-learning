class_name BasicEnemy
extends Character

@export var player : Player

var player_slot : EnemySlot = null

func handle_input() -> void:
	if player != null and can_move():
		
		if player_slot == null :
			player_slot = player.reserve_slot(self)
		
		if player_slot != null :
			var direction := (player_slot.position - global_position).normalized()
			velocity = direction * speed

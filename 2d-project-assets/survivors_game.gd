extends Node2D

const MOB_CAP: int = 200
var mob_count : int = 0

func spawn_mob()-> void:
	var new_mob = preload("uid://y38gte5o0xf8").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)


func _on_timer_timeout() -> void:
	if mob_count <= MOB_CAP:
		spawn_mob()
		mob_count += 1
	

func _on_player_health_depleted() -> void:
	%GameOver.visible = true
	get_tree().paused = true

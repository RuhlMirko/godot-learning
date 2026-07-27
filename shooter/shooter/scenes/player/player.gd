extends CharacterBody2D

signal laser(position)
signal grenade

const speed : int = 400
var can_laser: bool = true
var can_grenade: bool = true

func _process(_delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up","down")
	velocity = direction * speed 
	move_and_slide()
	
	if Input.is_action_just_pressed("primary action") and can_laser:
		var laser_markers = $LaserSpawner.get_children()
		var selected_marker = laser_markers[randi() % laser_markers.size()]
		can_laser = false
		$ShootTimer.start()
		laser.emit(selected_marker.global_position)
		
	if Input.is_action_just_pressed("secondary action") and can_grenade:
		grenade.emit()
		can_grenade = false
		$GrenadeTimer.start()

func _on_timer_timeout() -> void:
	can_laser = true
	

func _on_grenade_timer_timeout() -> void:
	can_grenade = true
	

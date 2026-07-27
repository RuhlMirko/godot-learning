extends CharacterBody2D

const speed : int = 400

func _process(_delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up","down")
	velocity = direction * speed 
	move_and_slide()
	
	if Input.is_action_just_pressed("primary action"):
		print("shoot")
	if Input.is_action_just_pressed("secondary action"):
		print("grenade")

class_name Ball
extends CharacterBody2D

enum State { Docked, Flying }
@export var speed := 100.0
@export var paddle: Paddle
@export var min_bounce_angle : float = 0.3
var curr_state := State.Docked

func _ready() -> void:
	var direction := Vector2(randf_range(-1,1), -1).normalized()
	velocity = direction * speed

func _physics_process(delta: float) -> void:
	if position.y > 200:
		queue_free()
	if curr_state == State.Docked:
		position = paddle.position + Vector2(0,-8)
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			curr_state = State.Flying
	if curr_state == State.Flying:
		fly(delta)

func launch(spawn_pos):
	position = spawn_pos
	curr_state = State.Flying

func fly(delta):
	var collision:= move_and_collide(velocity * delta)
	if collision != null:
		var collider := collision.get_collider()
		$AnimationPlayer.play("bounce")
		if collider is Paddle:
			velocity = get_velocity_from_paddle(collider)
			$Audio/paddleBounce.play()
		else:
			if collider is Brick:
				collider.take_damage()
				$Audio/brickBounce.play()
			else:
				$Audio/wallBounce.play()
			velocity = velocity.bounce(collision.get_normal())
			fix_shallow_angle()
			

func fix_shallow_angle():
	var direction := velocity.normalized()
	if direction.y > 0 and direction.y < min_bounce_angle:
		direction.y = min_bounce_angle
	elif direction.y < 0 and direction.y > -min_bounce_angle:
		direction.y = -min_bounce_angle
	velocity = direction * speed

func get_velocity_from_paddle(_paddle: Paddle)-> Vector2:
	var paddle_half_width := 16
	var offset := (position.x - paddle.position.x) / paddle_half_width
	offset = clamp(offset, -1, 1)
	return Vector2(offset, -1).normalized() * speed
	

func fly_ball():
	curr_state = State.Flying

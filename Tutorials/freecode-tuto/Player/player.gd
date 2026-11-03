extends CharacterBody2D

enum State {Idle, Run, Jump, Falling, Dying}

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var curr_state = State.Idle
var health = 10
@onready var anim: AnimationPlayer = $AnimationPlayer


func _process(_delta: float) -> void:
	if health <= 0:
		die()
	
	if curr_state == State.Idle:
		anim.play("idle")
	if curr_state == State.Run:
		anim.play("run")
	if curr_state == State.Jump:
		anim.play("jump")
	if curr_state== State.Falling:
		anim.play("fall")
		
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor() and curr_state != State.Dying:
		velocity.y = JUMP_VELOCITY
		curr_state = State.Jump

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction and curr_state != State.Dying:
		velocity.x = direction * SPEED
		
		if velocity.y == 0:
			curr_state = State.Run
		if direction < 0:
			$AnimatedSprite2D.flip_h = true
		else: 
			$AnimatedSprite2D.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.y == 0:
			curr_state = State.Idle
	if velocity.y > 0:
		curr_state = State.Falling

	move_and_slide()
	
func die():
	curr_state = State.Dying
	anim.play("die")
	await $AnimatedSprite2D.animation_finished
	get_tree().paused = true
	#self.queue_free()

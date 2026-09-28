extends CharacterBody2D

enum State {Idle, Run, Jump}

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var curr_state = State.Idle
@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _process(_delta: float) -> void:
	if curr_state == State.Idle:
		anim_sprite.play("Idle")
	if curr_state == State.Run:
		anim_sprite.play("Run")
	if curr_state == State.Jump:
		anim_sprite.play("Jump")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		curr_state = State.Jump

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		curr_state = State.Run
		if direction < 0:
			anim_sprite.flip_h = true
		else: 
			anim_sprite.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		curr_state = State.Idle

	move_and_slide()

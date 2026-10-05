extends CharacterBody2D


enum State {Idle, Run, Jump, Fall}
@export var move_speed : float = 120.0
var curr_state := State.Idle

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _process(_delta: float) -> void:
	if curr_state == State.Idle:
		$AnimationPlayer.play("idle")
	if curr_state == State.Run:
		$AnimationPlayer.play("move")
	if curr_state == State.Jump:
		$AnimationPlayer.play("jump")
	if curr_state == State.Fall:
		$AnimationPlayer.play("fall")


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		curr_state = State.Fall

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		curr_state = State.Jump

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		curr_state = State.Run
		if direction >= 0:
			$Sprite.flip_h = false
		else: 
			$Sprite.flip_h = true
	
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		curr_state = State.Idle

	move_and_slide()

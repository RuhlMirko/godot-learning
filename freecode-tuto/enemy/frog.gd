extends CharacterBody2D

enum State {Idle, Jump, Dying}
@export var SPEED :float = 70.0
const BOUNCE : float = -300.0
var chase = false
var curr_state = State.Idle

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if curr_state == State.Idle:
		$AnimatedSprite2D.play("idle")
	if curr_state == State.Jump:
		$AnimatedSprite2D.play("jump")
	if curr_state == State.Dying:
		$AnimatedSprite2D.play("die")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	if is_on_floor():
		velocity.y += 400.0
	var direction = ($"../Player".position - self.position).normalized()
	if chase == true:
		if direction.x > 0:
			velocity.x = direction.x * SPEED
			$AnimatedSprite2D.flip_h = true
		else: 
			velocity.x = direction.x * SPEED
			$AnimatedSprite2D.flip_h = false
	else: 
		velocity.x = 0
		curr_state = State.Idle
	move_and_slide()

func _on_detection_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		chase = true
	curr_state = State.Jump


func _on_detection_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		chase = false


func _on_death_hitbox_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.velocity.y = BOUNCE
		curr_state = State.Dying
		await $AnimatedSprite2D.animation_finished
		
		self.queue_free()
		


func _on_attack_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.health -= 2

extends CharacterBody2D

var _gravity : float = ProjectSettings.get("physics/2d/default_gravity")
var _jumped: bool = false
const JUMP_FORCE : float = -350.0

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		
		_jumped = true

func _physics_process(delta: float) -> void:
	velocity.y += _gravity * delta
	if _jumped:
		velocity.y += JUMP_FORCE
		_jumped = false
		animation_player.play("fly")
	move_and_slide()

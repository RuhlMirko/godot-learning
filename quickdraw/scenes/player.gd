extends Node2D

enum State {Waiting, Shooting, Dying, Fumbling}

signal shot_gun(action)
@export var action_name = "p1shoot"
var current_state = State.Waiting
var can_shoot = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if current_state == State.Waiting and Input.is_action_just_pressed(action_name):
		if can_shoot:
			shoot()
		else:
			fumble()
			

func shoot():
	current_state = State.Shooting
	$AnimationPlayer.play("shoot")
	shot_gun.emit(action_name)

func fumble():
	current_state = State.Fumbling
	$AnimationPlayer.play("fumble")

func kill():
	current_state = State.Dying
	$AnimationPlayer.play("die")

func wait():
	current_state = State.Waiting
	$AnimationPlayer.play("idle")

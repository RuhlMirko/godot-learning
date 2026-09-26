extends Node2D

signal shot_gun(action)
@export var action_name = "p1shoot"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed(action_name):
		$AnimationPlayer.play("shoot")
		shot_gun.emit(action_name)

func kill():
	$AnimationPlayer.play("die")

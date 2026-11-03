extends RigidBody2D

@export var speed : int = 500

func explode()->void:
	$AnimationPlayer.play("explosion")
	print("explode called")

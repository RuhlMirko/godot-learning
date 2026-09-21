extends Node2D

var p1_can_shoot: bool = true
var p2_can_shoot: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("p1shoot") and p1_can_shoot:
		$Player/AnimationPlayer.play("shoot")
		$Player2/AnimationPlayer.play("die")
		p2_can_shoot = false
	if event.is_action_pressed("p2shoot") and p2_can_shoot:
		$Player2/AnimationPlayer.play("shoot")
		$Player/AnimationPlayer.play("die")
		p1_can_shoot = true

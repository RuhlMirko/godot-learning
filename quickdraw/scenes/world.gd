extends Node2D

var p1_can_shoot: bool = false
var p2_can_shoot: bool = false

@onready var plank_label: Label = $Plank/Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$NewGameLBL.visible = false
	randomize_timer()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print($Timer.time_left)

func randomize_timer()->void:
	$Timer.wait_time = randf_range(4.0,8.0)
	$Timer.start()
	
func start_round()->void:
	
	randomize_timer()
	p1_can_shoot = false
	p2_can_shoot = false
	plank_label.text = "STEADY"

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("p1shoot") and p1_can_shoot:
		$Player/AnimationPlayer.play("shoot")
		$Player2/AnimationPlayer.play("die")
		p2_can_shoot = false
	if event.is_action_pressed("p2shoot") and p2_can_shoot:
		$Player2/AnimationPlayer.play("shoot")
		$Player/AnimationPlayer.play("die")
		p1_can_shoot = true


func _on_timer_timeout() -> void:
	p1_can_shoot = true
	p2_can_shoot = true
	plank_label.text = "SHOOT!"
	plank_label.label_settings.font_color = "#05ee01"

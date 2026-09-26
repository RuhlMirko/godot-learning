extends Node2D

@onready var plank_label: Label = $Plank/Label

func _ready() -> void:
	$NewGameLBL.visible = false
	randomize_timer()

func _process(_delta: float) -> void:
	#print($Timer.time_left)
	pass

func randomize_timer()->void:
	$Timer.wait_time = randf_range(4.0,8.0)
	$Timer.start()

func _on_timer_timeout() -> void:
	plank_label.text = "SHOOT!"
	plank_label.label_settings.font_color = "#05ee01"
	start_duel()

func start_duel():
	$Player.can_shoot = true
	$Player2.can_shoot = true

func resolve_duel(action):
	print(action)
	if action=="p1shoot":
		$Player2.kill()
	elif action=="p2shoot":
		$Player.kill()

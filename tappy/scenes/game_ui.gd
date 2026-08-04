extends Control

@onready var game_over_label: Label = $MarginContainer/GameOverLabel
@onready var change_label_timer: Timer = $ChangeLabelTimer
@onready var game_over_label_2: Label = $MarginContainer/GameOverLabel2
@onready var game_over_sound: AudioStreamPlayer = $gameOverSound
@onready var score_label: Label = $MarginContainer/ScoreLabel

var can_go_main:bool= false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump") and can_go_main:
		ComplexChange.load_main_screen()

func _ready() -> void:
	Signalhub.tappy_died.connect(game_over)
	Signalhub.scored.connect(on_point_scored)
	#on_point_scored(0)
	
	can_go_main = false

func game_over()->void:
	game_over_label.show()
	change_label_timer.start()
	game_over_sound.play()

func on_point_scored(score:int)->void:
	score_label.text = "%04d" % score

func _on_change_label_timer_timeout() -> void:
	can_go_main = true
	game_over_label.hide()
	game_over_label_2.show()

#func _process(delta: float) -> void:
	#

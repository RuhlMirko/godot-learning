extends Control

@onready var game_over_label: Label = $MarginContainer/GameOverLabel
@onready var change_label_timer: Timer = $ChangeLabelTimer
@onready var game_over_label_2: Label = $MarginContainer/GameOverLabel2
@onready var game_over_sound: AudioStreamPlayer = $gameOverSound

var can_go_main:bool= false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump") and can_go_main:
		GameManager.load_main_screen()

func _ready() -> void:
	Signalhub.tappy_died.connect(game_over)
	can_go_main = false

func game_over()->void:
	game_over_label.show()
	change_label_timer.start()
	game_over_sound.play()


func _on_change_label_timer_timeout() -> void:
	can_go_main = true
	game_over_label.hide()
	game_over_label_2.show()

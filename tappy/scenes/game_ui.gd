extends Control

@onready var game_over_label: Label = $MarginContainer/GameOverLabel

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("dev"):
		GameManager.load_main_screen()

func _ready() -> void:
	Signalhub.tappy_died.connect(game_over)

func game_over()->void:
	game_over_label.show()

extends Node

const SAVE_PATH = "user://highscore.cfg"
var high_score: int = 0

func _ready():
	load_high_score()

func update_high_score(new_score: int):
	if new_score > high_score:
		high_score = new_score
		save_high_score()

func save_high_score():
	var config = ConfigFile.new()
	config.set_value("Scores", "high_score", high_score)
	config.save(SAVE_PATH)

func load_high_score():
	var config = ConfigFile.new()
	var err = config.load(SAVE_PATH)
	if err == OK:
		high_score = config.get_value("Scores", "high_score", 0)

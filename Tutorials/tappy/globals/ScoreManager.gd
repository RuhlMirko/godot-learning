extends Node

const SAVE_PATH : String = "user://tappy_game.dat"

var _score : int = 0
var high_score : int = 0
	#set(value):
		#if value > high_score:
			#high_score = value
			#save_to_file()

func _ready() -> void:
	load_from_file()
	Signalhub.tappy_died.connect(on_tappy_died)

func on_tappy_died()->void:
	if _score > high_score:
			high_score = _score
			save_to_file()
	reset_score()

func reset_score()->void:
	_score = 0

func add_point()->void:
	_score += 1
	Signalhub.scored_gate(_score)
	
func save_to_file():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if !file:
		push_error("Save file not found")
		return
	file.store_32(high_score)

func load_from_file():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if !file:
		push_error("Save file not found")
		return
	high_score = file.get_32()
	return high_score

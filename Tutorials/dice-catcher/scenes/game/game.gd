extends Node

#const dice_scene : PackedScene = preload("res://scenes/dice/dice.tscn")
const DICE_SCENE = preload("uid://c6wsbyjga68up")
var _score: int  = 0
@onready var label: Label = $Label
@onready var game_over_label: Label = $GameOverLabel
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
const GAME_OVER = preload("uid://c0orcx0ncovyq")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_dice()
	get_tree().paused = false
	game_over_label.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_dice()->void:
	var newDice: Dice = DICE_SCENE.instantiate()
	newDice.game_over.connect(game_over)
	add_child(newDice)
	
func game_over()->void:
	audio_stream_player.stop()
	audio_stream_player.stream = GAME_OVER
	audio_stream_player.play()
	game_over_label.show()

func _on_spawner_timer_timeout() -> void:
	spawn_dice()


func _on_fox_fox_ate() -> void:
	_score += 1
	label.text = "%04d" % _score

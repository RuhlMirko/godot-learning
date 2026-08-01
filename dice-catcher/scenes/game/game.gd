extends Node

#const dice_scene : PackedScene = preload("res://scenes/dice/dice.tscn")
const DICE_SCENE = preload("uid://c6wsbyjga68up")
var _score: int  = 0
@onready var label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_dice()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_dice()->void:
	var newDice: Dice = DICE_SCENE.instantiate()
	add_child(newDice)


func _on_spawner_timer_timeout() -> void:
	spawn_dice()


func _on_fox_fox_ate() -> void:
	_score += 1
	print(_score)
	label.text = String(str(_score)).lpad(4,"0")

extends Node

@export var dice_scene : PackedScene = preload("res://scenes/dice/dice.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_dice()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_dice()->void:
	var newDice: Dice = dice_scene.instantiate()
	add_child(newDice)


func _on_spawner_timer_timeout() -> void:
	spawn_dice()

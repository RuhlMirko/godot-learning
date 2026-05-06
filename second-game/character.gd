class_name Character

extends Node

@export var profession : String
@export var health: int


var chest := Equipment.new()
var legs := Equipment.new()

func _ready() -> void:
	chest.armor = 20
	print(chest.armor)
	print(legs.weight)

class Equipment:
	var armor:= 10
	var weight:= 5

func die():
	health = 0
	print(profession + ' died')

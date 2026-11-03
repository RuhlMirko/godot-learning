class_name BaseLevel
extends Node3D

@onready var player_spawner: Node3D = %PlayerSpawner
const PLAYER_PREFAB := preload("uid://dgjwartjgf3mq")

func _ready() -> void:
	var player : Player = PLAYER_PREFAB.instantiate()
	player.global_transform = player_spawner.global_transform
	
	add_child(player)

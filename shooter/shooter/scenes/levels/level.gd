extends Node2D

var laser_scene : PackedScene = preload("res://scenes/projectiles/laser.tscn")

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass

func _on_gate_player_entered_gate(body) -> void:
	print("player on gate ", body)

func _on_player_laser(pos) -> void:
	print("laser from level")
	var laser = laser_scene.instantiate()
	laser.position = pos
	$Projectiles.add_child(laser)

func _on_player_grenade() -> void:
	print("grenade from level")

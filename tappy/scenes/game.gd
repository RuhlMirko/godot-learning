extends Node

const PIPES_SCENE : PackedScene = preload("uid://ddkk8c55mitlj")

@onready var upper_spawn: Marker2D = $UpperSpawn
@onready var lower_spawn: Marker2D = $LowerSpawn
@onready var pipes: Node2D = $Pipes


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(upper_spawn.position.y, lower_spawn.position.y)


func _on_spawner_timer_timeout() -> void:
	spawn_pipe()

func spawn_pipe()->void:
	var newPipe : Pipes = PIPES_SCENE.instantiate()
	var random_y : float = randf_range(lower_spawn.position.y, upper_spawn.position.y)
	newPipe.position = Vector2(upper_spawn.position.x, random_y)
	
	pipes.add_child(newPipe)

extends Node2D

var world 
var p1_global_score : int = 0
var p2_global_score : int = 0

func _ready() -> void:
	create_world()

func create_world():
	var world_blueprint = load("uid://brh32dhhpy40f")
	world = world_blueprint.instantiate()
	add_child(world)
	world.round_over.connect(restart)
	
func restart():
	world.queue_free()
	create_world()

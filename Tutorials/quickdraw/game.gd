extends Node2D

var world 
var p1_global_score : int = 0
var p2_global_score : int = 0

func _ready() -> void:
	create_world()

func create_world():
	var world_blueprint = load("uid://brh32dhhpy40f")
	world = world_blueprint.instantiate()
	world.p1_score = p1_global_score
	world.p2_score = p2_global_score
	add_child(world)
	world.round_over.connect(restart)
	
	
func restart(winner):
	if winner == "p2":
		p2_global_score += 1
	else:
		p1_global_score += 1
	world.queue_free()
	create_world()

extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var world_blueprint = load("uid://brh32dhhpy40f")
	var world = world_blueprint.instantiate()
	add_child(world)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

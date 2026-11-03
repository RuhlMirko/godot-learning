extends Node


const ANIMAL = preload("uid://dkp2iugphylyy")


@onready var start: Marker2D = $Start


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_animal_died.connect(spawn_animal)
	spawn_animal()


func spawn_animal() -> void:
	var animal: Animal = ANIMAL.instantiate()
	animal.position = start.position
	call_deferred("add_child", animal)

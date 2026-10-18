extends StaticBody2D

signal speed_buff
signal destroyed(brick: Brick)
@export var points := 10

var health := 1
var is_dying := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func take_damage():
	speed_buff.emit()
	destroyed.emit(self)
	is_dying = true
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

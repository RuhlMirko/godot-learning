extends Node2D
class_name Pipes
@export var speed: float = 120

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= speed * delta 


func _on_screen_exited_notifier() -> void:
	#print("Exited")
	queue_free()


func _on_pipe_body_entered(body: Node2D) -> void:
	print("_body_entered: %s %s" % [name, body.name])
	
	if body.has_method("die"):
		body.die()


func _on_laser_body_entered(body: Node2D) -> void:
	print("+1")

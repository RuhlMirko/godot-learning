extends Area2D

func _on_mouse_entered() -> void:
	print("mouse on dice")

func newFace() -> int:
	return randi() % 6


#var currFace = newFace()
	#$Face.frame = currFace
	#print(currFace + 1)

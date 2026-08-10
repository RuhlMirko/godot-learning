extends Node


@export var ball_scene : PackedScene

var ball_images := []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_images()
	new_game()

func new_game() -> void:
	generate_balls()
	
func load_images()->void:
	for i in range(1,17,1):
		var filename = str("res://assets/ball_",i,".png")
		var ball_image = load(filename)
		ball_images.append(ball_image)
		
func generate_balls()->void:
	var count : int = 0
	var rows : int = 5
	# diameter
	var dia = 36
	for col in range(5):
		for row in range(rows):
			var b = ball_scene.instantiate()
			var pos = Vector2( 250 + (col * (dia)), 267 + (row * (dia)) + (col*dia/2) )
			add_child(b)
			b.position = pos
			b.get_node("Sprite2D").texture = ball_images[count]
			count +=1
		rows -= 1
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

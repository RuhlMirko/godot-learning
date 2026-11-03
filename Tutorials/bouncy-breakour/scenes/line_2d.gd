extends Line2D

var prev_pos := Vector2.ZERO
var ball_radius := 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var sprite_texture = get_parent().texture
	ball_radius = sprite_texture.get_size().x * 0.5
	prev_pos = get_parent().global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var curr_pos = get_parent().global_position
	var direction = (curr_pos - prev_pos).normalized()
	
	add_point(curr_pos - ball_radius * direction)
	
	if points.size()>10:
		remove_point(0)
		
	prev_pos = curr_pos

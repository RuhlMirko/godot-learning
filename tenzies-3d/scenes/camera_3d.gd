extends Camera3D
@export var tilt_amount: float = 3.0
@export var tilt_speed: float = 5.0

var base_rotation: Vector3

func _ready() -> void:
	base_rotation = rotation_degrees

func _process(delta: float) -> void:
	var viewport_size = get_viewport().get_visible_rect().size
	var mouse_pos = get_viewport().get_mouse_position()

	# Normalize mouse position (min -1, max 1)
	var mouse_x = (mouse_pos.x / viewport_size.x) * 2.0 - 1.0
	var mouse_y = (mouse_pos.y / viewport_size.y) * 2.0 - 1.0

	# Calculate target tilt
	var target_y = -mouse_y * tilt_amount 
	var target_x = -mouse_x * tilt_amount / 1.5 # Less movement left and right
	var target_rotation = base_rotation + Vector3(
		target_y,
		target_x,
		0.0
	)
	
	# Smoothly rotate camera to cursor
	rotation_degrees = rotation_degrees.lerp(
		target_rotation,
		tilt_speed * delta
	)

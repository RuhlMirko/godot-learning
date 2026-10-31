extends RigidBody3D


var start_pos
var roll_strength = 30
var faces: Dictionary = {
	Vector3.UP: 5,
	Vector3.DOWN: 1,
	Vector3.FORWARD: 2,
	Vector3.BACK: 6,
	Vector3.RIGHT: 3,
	Vector3.LEFT: 4
}

signal roll_finished(value)

func _ready() -> void:
	start_pos = global_position

func _process(delta: float) -> void:
	if sleeping:
		print("Stoped moving")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		
		
		roll()
		

func roll()->void:
	reset_state()
	random_rotate_die()
	
	var throw_vector = Vector3(randf_range(-1, 1), 0, randf_range(-1,1)).normalized()
	angular_velocity = throw_vector * roll_strength / 2
	apply_central_impulse(throw_vector * roll_strength)

## Generates random rotation from angle in radians to degrees - up to 360 deg in all axis
func random_rotate_die()->void:
	transform.basis = Basis(Vector3.RIGHT, randf_range(0, 2 * PI)) * transform.basis
	transform.basis = Basis(Vector3.UP, randf_range(0, 2 * PI)) * transform.basis
	transform.basis = Basis(Vector3.FORWARD, randf_range(0, 2 * PI)) * transform.basis


func reset_state()->void:
	print(get_top_face())
	sleeping = false
	freeze = false
	transform.origin = start_pos
	linear_velocity = Vector3.ZERO
	angular_velocity = Vector3.ZERO

# Calculate which dot has the highest Up value
func get_top_face() -> int:
	var highest_dot := -INF
	var top_value := 0

	for normal in faces:
		var world_normal = global_transform.basis * normal
		var dot = world_normal.dot(Vector3.UP)
		if dot > highest_dot:
			highest_dot = dot
			top_value = faces[normal]

	return top_value

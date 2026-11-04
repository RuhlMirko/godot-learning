class_name Die
extends RigidBody3D

# TODO: When clicking on die pass value to game scene
# TODO: Make selected dice be displayed on the right side of table
# TODO: Add background
# TODO: Update table model and texture with higher poly
signal selected_value(value)

@onready var die_hit: AudioStreamPlayer3D = $DieHit
@onready var dice_mesh: MeshInstance3D = $dice/Dice
const DICE_HIGHLIGHT_MAT = preload("uid://cvoqnjcqscha0")
const DICE_ANCHOR_MAT = preload("uid://dj2an4ci2faui")
const DICE_OG_MAT = preload("uid://b5k8kggox4mij")

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
var rolling : bool = false
var was_chosen = false


func _ready() -> void:
	start_pos = global_position
	sleeping_state_changed.connect(_on_body_sleeping_state_changed)
	roll()
	# Enable collision monitoring
	contact_monitor = true
	max_contacts_reported = 10
	# Connect the signal
	body_entered.connect(_on_body_collision)

func _on_body_sleeping_state_changed() -> void:
	if sleeping:
		rolling = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept") and !rolling and !was_chosen:
		roll()
		

func roll()->void:
	reset_state()
	random_rotate_die()
	
	var throw_vector = Vector3(randf_range(-1, 1), 0, randf_range(-1,1)).normalized()
	angular_velocity = throw_vector * roll_strength / 2
	apply_central_impulse(throw_vector * roll_strength)
	rolling = true

## Generates random rotation from angle in radians to degrees - up to 360 deg in all axis
func random_rotate_die()->void:
	transform.basis = Basis(Vector3.RIGHT, randf_range(0, 2 * PI)) * transform.basis
	transform.basis = Basis(Vector3.UP, randf_range(0, 2 * PI)) * transform.basis
	transform.basis = Basis(Vector3.FORWARD, randf_range(0, 2 * PI)) * transform.basis


func reset_state()->void:
	#sleeping = false
	freeze = false
	transform.origin = start_pos
	linear_velocity = Vector3.ZERO
	angular_velocity = Vector3.ZERO
	rolling = true

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


# Hover effects
func _on_area_mouse_entered() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	if was_chosen:
		dice_mesh.material_override = DICE_ANCHOR_MAT
	else:
		dice_mesh.material_override = DICE_HIGHLIGHT_MAT
func _on_area_mouse_exit() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	
	if was_chosen:
		dice_mesh.material_override = DICE_ANCHOR_MAT
	else:
		dice_mesh.material_override = DICE_OG_MAT

func _on_area_input_event(_camera: Node,event: InputEvent,_event_position: Vector3,_normal: Vector3,_shape_idx: int) -> void:
	if event.is_action_pressed("select") and !was_chosen and !rolling:
		was_chosen = true
		sleeping = true
		freeze = true
		selected_value.emit(get_top_face())


func _on_body_collision(_body: Node) -> void:
	die_hit.play()

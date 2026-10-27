class_name Player
extends CharacterBody3D

const MAX_ANGLE_Y_UP := deg_to_rad(70)
const MAX_ANGLE_Y_DOWN := deg_to_rad(-90)
@export var mouse_sensitivity : float
@export var player_speed := 4
@export var sprint_speed := 8
@onready var camera: Camera3D = %Camera3D

var input_dir := Vector2.ZERO

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouse_sensitivity)
		camera.rotate_x(-event.relative.y * mouse_sensitivity)
		camera.rotation.x = clampf(camera.rotation.x, MAX_ANGLE_Y_DOWN, MAX_ANGLE_Y_UP)


func _process(delta: float) -> void:
	input_dir = Input.get_vector("left","right","backward","forward")
	

func _physics_process(delta: float) -> void:
	var input3d_space := Vector3(input_dir.x, 0, -input_dir.y)
	if Input.is_action_pressed("run"):
		velocity = transform.basis * input3d_space * sprint_speed
	else:
		velocity = transform.basis * input3d_space * player_speed
	move_and_slide()

class_name Player
extends CharacterBody3D

const MAX_ANGLE_Y_UP := deg_to_rad(70)
const MAX_ANGLE_Y_DOWN := deg_to_rad(-90)
const ACCELERATION := 30
@export var mouse_sensitivity : float
@export var player_speed := 4
@export var sprint_speed := 8
@export var jump_force := 12
@export var gravity_force : float
@onready var camera: Camera3D = %Camera3D
@onready var animation_player: AnimationPlayer = $character/AnimationPlayer



var input_dir := Vector2.ZERO

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouse_sensitivity)
		camera.rotate_x(-event.relative.y * mouse_sensitivity)
		camera.rotation.x = clampf(camera.rotation.x, MAX_ANGLE_Y_DOWN, MAX_ANGLE_Y_UP)


func _process(_delta: float) -> void:
	input_dir = Input.get_vector("left","right","backward","forward")
	

func _physics_process(delta: float) -> void:
	check_jump_input()
	process_gravity()
	
	var input3d_space := Vector3(input_dir.x, 0, -input_dir.y)
	var target_speed := sprint_speed if Input.is_action_pressed("run") else player_speed
	var desired_velocity := transform.basis * input3d_space * target_speed 
	if input3d_space == Vector3.ZERO:
		velocity.x = move_toward(velocity.x, 0, ACCELERATION * delta)
		velocity.z = move_toward(velocity.z, 0, ACCELERATION * delta)
	else:
		velocity.x = move_toward(velocity.x, desired_velocity.x, ACCELERATION * delta)
		velocity.z = move_toward(velocity.z, desired_velocity.z, ACCELERATION * delta)
		
	var horizontal_velocity := Vector3(velocity.x, 0, velocity.z)
	if horizontal_velocity.length_squared()>0.1 and is_on_floor():
		animation_player.play("run")
	else:
		animation_player.play("idle")
	move_and_slide()


func check_jump_input()->void:
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = jump_force
	
func process_gravity()->void:
	if not is_on_floor():
		velocity.y -= gravity_force

class_name Animal
extends RigidBody2D

const DRAG_LIMIT_MAX:Vector2= Vector2(0,60)
const DRAG_LIMIT_MIN:Vector2= Vector2(-60,0)
@onready var label: Label = $Label
@onready var arrow: Sprite2D = $Arrow
@onready var stretch_sound: AudioStreamPlayer = $StretchSound
var _start : Vector2 = Vector2.ZERO
var _drag_start : Vector2 = Vector2.ZERO
var _is_dragging: bool = false
var _drag_vector: Vector2 = Vector2.ZERO


func _input(event: InputEvent) -> void:
	#if event.is_action_pressed("drag"):
		#freeze = false
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_start = position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var debug_str = "Fr: %s\nCC: %d\nSl: %s\n" % [freeze, get_contact_count(), sleeping]
	debug_str += "is_dragging: %s\n drag_start:%.0f,%.0f\n drag_v2:%.0f,%.0f" % [_is_dragging, _drag_start.x, _drag_start.y, _drag_vector.x, _drag_vector.y]
	label.text = debug_str

func _physics_process(delta: float) -> void:
	if _is_dragging: handle_dragging()

func start_dragging()->void:
	arrow.show()
	_is_dragging = true
	_drag_start = get_global_mouse_position()

func handle_dragging()->void:
	var new_dragVec2 : Vector2 = get_global_mouse_position() - _drag_start
	new_dragVec2 = new_dragVec2.clamp(DRAG_LIMIT_MIN, DRAG_LIMIT_MAX)
	var diff : Vector2 = new_dragVec2 - _drag_vector
	if diff.length()>0 and !stretch_sound.playing:
		stretch_sound.play()
	
	_drag_vector = new_dragVec2
	position = _start + _drag_vector
	

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("drag"):
		input_event.disconnect(_on_input_event)
		start_dragging()

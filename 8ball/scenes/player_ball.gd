extends RigidBody2D

const IMPULSE_MULT : float = 10.0
@onready var label: Label = $Label
@onready var marker: Sprite2D = $Marker

var currMousePos : Vector2

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		print("Called")
		apply_central_impulse(calculate_impulse())
		label.text += str(calculate_impulse())
		marker.global_position = calculate_impulse()
		#marker.position = Vector2(200, 200)
	

func calculate_impulse()->Vector2:
	
	return (currMousePos * IMPULSE_MULT )

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	currMousePos = get_global_mouse_position()
	label.text = str(currMousePos)

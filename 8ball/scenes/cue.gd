extends Sprite2D

signal shoot
var power : float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var mouse_pos : = get_viewport().get_mouse_position()
	look_at(mouse_pos)
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) :
		power += 0.1
		if power >= get_parent().MAX_POWER:
			power = 0
	else:
		if power > 0:
			var direction = mouse_pos - position
			shoot.emit(power * direction)
			print(power)
			power = 0

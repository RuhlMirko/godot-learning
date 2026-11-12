extends Area3D

@onready var credits: CanvasLayer = $"../../../Credits"
@onready var receipt_mesh: MeshInstance3D = $"../Receipt"
@onready var controls_hints: CanvasLayer = $"../../../ControlsHints"
@onready var receipt_audio: AudioStreamPlayer2D = $"../ReceiptAudio"
const RECEPIT_OG_MAT = preload("uid://b18bohru2i57k")
const RECEPIT_HIGHLIGHT_MAT = preload("uid://fpqw2kp3n3uj")

func _input_event(_camera, event, _pos, _normal, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		credits.visible = !credits.visible
		controls_hints.visible = false
		receipt_audio.play()

func _on_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	receipt_mesh.material_override = RECEPIT_HIGHLIGHT_MAT

func _on_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	receipt_mesh.material_override = RECEPIT_OG_MAT


extends Area3D

@onready var panel: Panel = $"../../RulesOverlay/Panel"

@onready var book_mesh : MeshInstance3D = $"../Book"
@onready var controls_hints: CanvasLayer = $"../../ControlsHints"
const HIGHLIGHT_MAT : StandardMaterial3D = preload("uid://bqp25x12cdnel")
const BOOK_OG_MAT : StandardMaterial3D = preload("uid://c3c2ntquunpqd")

func _input_event(_camera, event, _pos, _normal, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		panel.visible = !panel.visible
		controls_hints.visible = false

func _on_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	book_mesh.material_override = HIGHLIGHT_MAT

func _on_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	book_mesh.material_override = BOOK_OG_MAT

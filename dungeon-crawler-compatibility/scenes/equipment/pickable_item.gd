class_name PickableItem

extends Area3D


const HIGHLIGHT_MAT = preload("res://materials/highlight_mat.tres")

@onready var collision_shape: CollisionShape3D = %CollisionShape
@export var weapon_data : WeaponData
var highlight_mat :StandardMaterial3D
var mesh_node : MeshInstance3D

func _ready() -> void:
	var pickable_object : Node3D = null
	highlight_mat = HIGHLIGHT_MAT.duplicate()
	if weapon_data: 
		pickable_object = weapon_data.glb_mesh.instantiate()
		if pickable_object != null:
			add_child(pickable_object)
			mesh_node = pickable_object.get_child(0) as MeshInstance3D
			collision_shape.shape = mesh_node.mesh.create_convex_shape()
			
func highlight()->void:
	mesh_node.material_override = highlight_mat
	
func unhighlight()->void:
	mesh_node.material_override = null

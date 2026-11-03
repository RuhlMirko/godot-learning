class_name EquipedItem
extends Node3D

const ZCLIP_MAT := preload("res://materials/zclip_mat.tres")

@export var is_always_infront : bool
@export var weapon_data : WeaponData

func _ready() -> void:
	var equiped_object := weapon_data.glb_mesh.instantiate()
	if equiped_object != null:
		add_child(equiped_object)
		var mesh_node := equiped_object.get_child(0) as MeshInstance3D
		if mesh_node != null and is_always_infront:
			mesh_node.material_override = ZCLIP_MAT.duplicate()

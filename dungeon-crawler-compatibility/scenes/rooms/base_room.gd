class_name BaseRoom
extends Node3D

@onready var ceilings: GridMap = %Ceilings
@onready var floor: GridMap = %Floor

var cell_ids_no_ceiling := []


func _ready() -> void:
	fill_ceiling()
	
func fill_ceiling()->void:
	for cell_name : String in ["Ground", "Hole-corner_002", "Hole-side_001", "Hole-uturn_001"]:
		cell_ids_no_ceiling.push_back(floor.mesh_library.find_item_by_name(cell_name))
	var used_cells : Array[Vector3i] = floor.get_used_cells()
	for cell_coords in used_cells:
		var tile_id : int = floor.get_cell_item(cell_coords)
		if cell_ids_no_ceiling.has(tile_id):
			ceilings.set_cell_item(cell_coords, 0)

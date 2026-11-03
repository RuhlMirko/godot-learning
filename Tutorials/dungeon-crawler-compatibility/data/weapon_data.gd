class_name WeaponData
extends Resource

@export var name : String
@export var condition: int
@export var max_condition: int
@export var dmg_min: int
@export var dmg_max: int
@export var reach: float
@export var throw_rotation_speed: float
@export var throw_movement_speed: float
@export var glb_mesh : PackedScene

func get_dmg_dealt()->int:
	return randi_range(dmg_min, dmg_max)
	
func decrease_condition(amount:int)->void:
	condition = clampi(condition- amount, 0, max_condition)

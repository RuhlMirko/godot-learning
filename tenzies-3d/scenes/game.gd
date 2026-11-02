extends Node3D

var selected_dice :Array[int]= []

func _on_die_selected_value(value: Variant) -> void:
	selected_dice.push_back(value)

extends Node

@onready var hobbit: Hobbit = $Hobbit
@onready var wizard: Wizard = $Wizard

func _on_wizard_cast_spell() -> void:	
	hobbit.hit_by_spell()



func _on_hobbit_hobbit_spell() -> void:
	wizard.hit_by_spell()

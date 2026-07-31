extends Node

@onready var hobbit: Hobbit = $Hobbit
@onready var wizard: Wizard = $Wizard


func _ready() -> void:
	wizard.cast_spell.connect(_on_wizard_cast_spell, ConnectFlags.CONNECT_ONE_SHOT)
	hobbit.hobbit_spell.connect(_on_hobbit_hobbit_spell)

func _on_wizard_cast_spell() -> void:
	hobbit.hit_by_spell()

func _on_hobbit_hobbit_spell() -> void:
	wizard.hit_by_spell()
	hobbit.hobbit_spell.disconnect(_on_hobbit_hobbit_spell)
	print("Hobbit spell")

extends Node

signal health_changed(new_health)
signal chance_changed(new_chance)

var health: float=100.0:
	set(value):
		health = clamp(value, 0.0, 100.0)
		health_changed.emit(health)

var chance: float = 6.2
var chanche_pct: int:
	get:
		return chance * 100
	set(value): 
		chance = float(value) / 100.0
		chance_changed.emit(chanche_pct)

var current_item : String= ''
const ITEM_LIST: Array[String] = ['Gun','Sword','Baseball Bat']
const WEAPONS_DICT : Dictionary={"Gun":20,"Baseball Bat":5,"Sword":15}

enum Alignment { ALLY, NEUTRAL, ENEMY }
@export var my_alignment: Alignment
@export var character_to_kill: Character

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text= str(health)
	$Label.modulate = Color.AQUA
	match my_alignment:
		Alignment.ALLY:
			$Alignment.text += 'Hello, friend'
		Alignment.NEUTRAL:
			$Alignment.text += 'I come in peace'
		Alignment.ENEMY:
			$Alignment.text += 'Taste my iron'
		_:
			$Alignment.text += 'Who the f ck are you?'



func _input(event: InputEvent) -> void:
	if event.is_action_pressed("my_action"):
		$Label.modulate = Color.RED
		if health<=0:
			health = 0
			character_to_kill.die()
		else:
			#health -= snapped(randf()*10, 0.01)
			#health -= snapped(randi_range(2.0,20.0), 0.01)
			current_item = ITEM_LIST[randf()*ITEM_LIST.size()]
			if current_item == 'Sword':
				chance += 4.0
			else:
				chance -= 1.0			
			$Alignment.text += ' - Chance percentage: ' + str(floor(chanche_pct))
			#health -= snapped(randi_range(5.0, WEAPONS_DICT[current_item]), 0.01)
			health -= WEAPONS_DICT[current_item]
			
		$Label.text= str(health) + ' with: ' + current_item
	if event.is_action_released("my_action"):
		$Label.modulate = Color.AQUA
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_health_changed(new_health: Variant) -> void:
	print(new_health)
	
func _on_chance_changed(new_chance: Variant) -> void:
	print(new_chance)

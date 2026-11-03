extends Area2D

@onready var timer := $Timer

func _on_ready()->void:
	timer.start()
	

func _on_timer_timeout() -> void:
	var dices = $Dices.get_children()
	print(dices, dices[0].frame)
	#print("Timer called")
	print(newDiceSet())

func newDiceSet()->Array[int]:
	# Generate array with random range values
	var diceAmount : int = 3
	var newDices: Array[int] = []
	newDices.resize(diceAmount)
	for i in range(diceAmount):
		newDices[i] = randi() % 6
		
	#var newDices = $Dices.get_children()
	#for i in range(diceAmount):
		#newDices[i].frame = randi() % 6
	
	return newDices
	

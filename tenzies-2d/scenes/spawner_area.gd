extends Area2D

@onready var timer := $Timer

#timer.start()

func  _on_ready()->void:
	timer.start()

func _on_timer_timeout() -> void:
	#set_newDiceSet()
	print("Timer called")

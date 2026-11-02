extends Node3D

var selected_dice :Array[int]= []
@onready var panel: Panel = $RulesOverlay/Panel
@onready var round_timer_label: Label = $ControlsHints/RoundTimerLabel
var round_over : bool = false
var time_elapsed : float= 0.0
var timer_running : bool = false

func _on_die_selected_value(value: Variant) -> void:
	selected_dice.push_back(value)
	print(selected_dice)
	if selected_dice.size() > 0:
		timer_running = true
		print("Timer start")
	if selected_dice.size() == 10:
		timer_running = false
		round_over = true
		check_dices()

# Check if dices are the same number, multiply by remaining time left
func check_dices()->void:
	pass

# Game stopwatch
func _process(delta):
	if timer_running:
		time_elapsed += delta
		# Format to show minutes and seconds
		var minutes : float = int(time_elapsed) / 60
		var seconds : float = int(time_elapsed) % 60
		round_timer_label.text = "%02d:%02d" % [minutes, seconds]


func reset_stopwatch()->void:
	time_elapsed = 0.0
	timer_running = true

func _on_book_overlay_close_pressed() -> void:
	panel.visible = false

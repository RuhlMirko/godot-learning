extends Node3D


@onready var panel: Panel = $RulesOverlay/Panel
@onready var round_timer_label: Label = $ControlsHints/RoundTimerLabel
@onready var round_over_UI: Control = $ControlsHints/RoundOver
@onready var controls_hints: CanvasLayer = $ControlsHints


var selected_dice :Array[int]= []
var round_over : bool = false
var time_elapsed : float= 0.0
var timer_running : bool = false


func _on_die_selected_value(value: Variant) -> void:
	selected_dice.push_back(value)
	print(selected_dice)
	if selected_dice.size() > 0 and !timer_running:
		timer_running = true
		print("Timer start")
	if selected_dice.size() == 10:
		check_dices()

# Check if dices are the same number, multiply by remaining time left
func check_dices()->void:
	var all_same_face : bool = selected_dice.all(func(e): return e == selected_dice[0])  
	print("All same face: ",all_same_face) 
	if all_same_face:
		timer_running = false
		round_over = true
		round_over_UI.visible = true

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
	controls_hints.visible = true

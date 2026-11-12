extends Node3D

signal restart_game

@onready var panel: Panel = $RulesOverlay/Panel
@onready var round_timer_label: Label = $ControlsHints/RoundTimerLabel
@onready var round_over_UI: Control = $ControlsHints/RoundOver
@onready var controls_hints: CanvasLayer = $ControlsHints
@onready var round_over_score_lbl: Label = $ControlsHints/RoundOver/Score
@onready var high_score_lbl: Label = $ControlsHints/RoundOver/HighScoreLbl
@onready var anim_score: AnimationPlayer = $ControlsHints/RoundOver/AnimationPlayer
@onready var credits: CanvasLayer = $Credits

var selected_dice: Array[int] = []
var round_over: bool = false
var time_elapsed: float = 0.0
var timer_running: bool = false
var curr_score: int = 0


func _ready() -> void:
	high_score_lbl.text = "High Score:\n" + str(Global.high_score)


func _unhandled_input(event: InputEvent) -> void:
	if round_over and event.is_action_pressed("reset_game"):
		restart_game.emit()


func _on_die_selected_value(value: Variant) -> void:
	selected_dice.push_back(value)
	print(selected_dice)
	if selected_dice.size() > 0 and !timer_running:
		timer_running = true
		print("Timer start")
	if selected_dice.size() == 10:
		check_dices()


# Check if dices are the same number, multiply by remaining time left
func check_dices() -> void:
	var all_same_face: bool = selected_dice.all(func(e): return e == selected_dice[0])
	print("All same face: ", all_same_face)
	timer_running = false
	round_over = true
	round_over_UI.visible = true
	anim_score.play("show_score")
	
	if all_same_face:
		curr_score = clampi(10000 - int(time_elapsed * 100), 0, 9999)
		Global.update_high_score(curr_score)
		round_over_score_lbl.text = "Score:\n" + str(curr_score)
	else:
		round_over_score_lbl.text = "All Faces\nmust match"
		
	high_score_lbl.text = "High Score:\n" + str(Global.high_score)


# Game stopwatch
func _process(delta: float) -> void:
	if timer_running:
		time_elapsed += delta
		var minutes: int = int(time_elapsed) / 60
		var seconds: int = int(time_elapsed) % 60
		round_timer_label.text = "%01d:%02d" % [minutes, seconds]
		round_timer_label.modulate = "#ffff1c"


func reset_stopwatch() -> void:
	time_elapsed = 0.0
	timer_running = true


func _on_book_overlay_close_pressed() -> void:
	panel.visible = false
	controls_hints.visible = true


func _on_credit_exit_pressed() -> void:
	credits.visible = false

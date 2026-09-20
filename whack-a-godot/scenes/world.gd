extends Node2D

var score : int = 0

func _process(_delta: float) -> void:
	$CountDownLBL.text = "Time: %d" % $CountdownTimer.time_left

func plus_score():
	#if $CountdownTimer.time_left != 0:
	score += 1
	$ScoreLabel.text = "SCORE: %d" % score

func minus_score():
	score -= 1

func _on_countdown_timer_timeout() -> void:
	$ScoreLabel.text = "FINAL SCORE: %d" % score
	$Button.visible = false

func _on_button_pressed() -> void:
	plus_score()
	#$Button/AnimationPlayer.play("hit")

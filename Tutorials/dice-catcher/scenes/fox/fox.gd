extends Area2D

signal foxAte

@export var speed : float = 300.0
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var buff_timer: Timer = $BuffTimer
var buff : bool = false
@onready var eating: AudioStreamPlayer = $Eating

func _process(delta: float) -> void:
	var move : float = Input.get_axis("left","right")
	
	if !is_zero_approx(move):
		sprite_2d.flip_h = move >= 0.0
	
	position.x += speed * delta * move


func _on_area_entered(area: Area2D) -> void:
	if !buff:
		speed *= 2
		buff_timer.start()
		buff = true
	area.queue_free()
	eating.play()
	foxAte.emit()


func _on_buff_timer_timeout() -> void:
	speed = 300.0
	buff = false

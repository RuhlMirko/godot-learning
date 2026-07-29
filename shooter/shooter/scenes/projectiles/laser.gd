extends Area2D

@export var speed : int = 2000
var direction : Vector2

func _ready() -> void:
	$Timer.start()

func _process(delta: float) -> void:
	position += direction * speed * delta

func _on_body_entered(body: Node2D) -> void:
	if "hit" in body:
		body.hit()
	queue_free()

func _on_timer_timeout() -> void:
	queue_free()

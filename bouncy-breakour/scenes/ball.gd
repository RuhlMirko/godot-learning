extends CharacterBody2D

@export var speed := 100.0
var bag : Array[String] = []

func loot(item:String, bag:Array[String]) -> void:
	if bag.has(item):
		print("Already in bag")
	else:
		bag.append(item)
		print(bag, " Call from loot")

func drop(item:String, bag:Array[String]) -> void:
	if !bag.has(item):
		print("Not in the bag")
	else:
		bag.erase(item)
		print(bag)
	
func _ready() -> void:
	var direction := Vector2(randf_range(-1,1), -1).normalized()
	velocity = direction * speed
	
	
	loot("map", bag)
	loot("key", bag)
	loot("map", bag)
	drop("map", bag)
	drop("gem", bag)

func _physics_process(delta: float) -> void:
	var collision:= move_and_collide(velocity * delta)
	if position.y >=200:
		queue_free()
	if collision != null:
		var collider := collision.get_collider()
		if collider is Paddle:
			velocity = get_velocity_from_paddle(collider)
		else:
			if collider is Brick:
				collider.take_damage()
			velocity = velocity.bounce(collision.get_normal())


func get_velocity_from_paddle(paddle: Paddle)-> Vector2:
	var paddle_half_width := 16
	var offset := (position.x - paddle.position.x) / paddle_half_width
	offset = clamp(offset, -1, 1)
	return Vector2(offset, -1).normalized() * speed
	

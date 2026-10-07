extends TextureButton

@export var level_setting : LevelSetting

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text = level_setting._to_string()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

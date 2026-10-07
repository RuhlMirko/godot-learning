extends Control

const MEMORY_TILE = preload("uid://cff6b5tvehowi")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_level_selected.connect(on_level_selected)

func on_level_selected(level_setting: LevelSetting) -> void:
	populate_tiles(level_setting.rows, level_setting.columns)

func populate_tiles(rows, cols)->void:	
	$HB/GridContainer.columns = cols
	for i:int in range(rows*cols):
		var new_tile = MEMORY_TILE.instantiate()
		$HB/GridContainer.add_child(new_tile)

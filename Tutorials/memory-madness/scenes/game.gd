extends Control

const MEMORY_TILE = preload("uid://cff6b5tvehowi")
@onready var grid_container: GridContainer = $HB/GridContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_level_selected.connect(on_level_selected)

func on_level_selected(level_setting: LevelSetting) -> void:
	populate_tiles(level_setting.rows, level_setting.columns)

func populate_tiles(rows, cols)->void:	
	grid_container.columns = cols
	for i:int in range(rows*cols):
		var new_tile = MEMORY_TILE.instantiate()
		grid_container.add_child(new_tile)


func _on_exit_button_pressed() -> void:
	for tile in grid_container.get_children():
		tile.queue_free()
	SignalHub.on_game_exit_pressed()

extends Node

var level = 0
const weapons = ['Gun','Sword','AK']
const character_info = {
	"level":0,
	"gun":"pistol"
}

func level_up()->void:
	level += 1

extends Node


func _process(_delta):
	for i in Tiles.Tiles:
		i.tick()

extends TextureRect

var _in = []
var pos = {"x":0, "y":0}

func _ready():
	pos["x"] = int(self.name.replace("Tile", ""))
	pos["y"] = int(get_parent().name.replace("TileGroup", ""))

func tick():
	for i in get_children():
		TileTypes.exec_item(_in, i.type)

extends TextureRect

var _in = []
var _out = []

func _ready():
	self.x = int(self.name.replace("Tile", ""))
	self.y = int(get_parent().name.replace("TileGroup", ""))
	self.data = Player.items[self.x][self.y]

func tick():
	_out = TileTypes.exec_item(_in, get_children()[0].type)

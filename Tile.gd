extends TextureRect

var _in = []
var _out = []
var x = 0
var y = 0
var t = 0
var data = {}

func _ready():
	x = int(self.name.replace("Tile", ""))
	y = int(get_parent().name.replace("TileGroup", ""))
	
func _process(_delta):
	if t == 0:
		data = Player.items[self.x][self.y]
		t += 1

func tick():
	_out = TileTypes.exec_item(_in, get_children()[0].type)

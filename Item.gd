extends TextureRect

var image = load("res://Images/Thumbnails/Frame.png")
var num = int(name.replace("Item", ""))

func _process(_delta):
	if Player.storage[Player.t]["inventory"][num]["id"] == "":
		image = load("res://Images/Thumbnails/Frame.png")
	else:
		image = load("res://Images/Thumbnails/"+Player.storage[Player.t]["inventory"][num]["id"].replace(":","")+".png")
		image = load("res://Images/Thumbnails/"+Player.storage[Player.t]["inventory"][num]["id"].replace(":","")+".png")
	texture = image

extends GridContainer

var image = load("res://Images/Thumbnails/Frame.png")

func f(num: int):
	if Player.storage[Player.t]["inventory"][num]["id"] == "":
		image = load("res://Images/Thumbnails/Frame.png")
	else:
		image = load("res://Images/Thumbnails/"+Player.storage[Player.t]["inventory"][num]["id"].replace(":","")+".png")
	return image

func _process(_delta):
	if Player.storage != Player.oldstorage:
		for i in get_children():
			i.texture = f(int(i.name.replace("Item", "")))

extends TextureRect

func _process(_delta):
	rect_position = Vector2(Player.storage.find(Player.selected_item)*204, 500)

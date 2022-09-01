extends Control

var Tiles = []

func _ready():
	for i in get_children():
		for f in i.get_children():
			Tiles.append(f)
			f.connect("mouse_entered", self, "_on_tile_press", [f])

func _on_tile_press(tile: TextureRect):
	if Input.action_press("click"):
		if Player.selected_item["id"] != "" and Player.items[tile.pos["y"]][tile.pos["x"]] == Player.nothing:
			tile.add_child(Player.get_scene_as_node_by_id(Player.selected_item["id"]))

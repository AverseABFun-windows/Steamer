extends Panel

const HotbarFactory = preload("res://addons/godot-hotbars/hotbar_factory.gd")

func _ready():
	var hotbarFactory = HotbarFactory.new()
	var hotbar_base = self
	var hotbar = hotbarFactory.create(10,1)
	hotbar.name = "Hotbar"
	hotbar.set_global_position(Vector2(0, 500))

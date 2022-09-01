extends Node

var nothing = {
	"id":"",
	"x":0,
	"y":0,
	"dir":0,
	"inventory":[],
	"max_size":0,
	"output":[]
	}

var items = [[
	{
	"id":"storage",
	 "x":0,
	 "y":0,
	 "dir":0,
	 "inventory":[
			{
				"id":"crafter", 
				"number":5
			}, 
			{
				"id":"pipe", 
				"number":50
			}, 
			{
				"id":"generator:wind", 
				"number":3
			}, 
			{
				"id":"iron", 
				"number":20
			},
			{
				"id":"",
				"number":0
			},
			{
				"id":"",
				"number":0
			},
			{
				"id":"",
				"number":0
			},
			{
				"id":"",
				"number":0
			},
			{
				"id":"",
				"number":0
			}
		], 
	 "max_size":9,
	 "output":[]
	}
]]
var selected_item = items[0]["inventory"][0]

var storage = []
var oldstorage = ["d"]

var t = 0
var ys = 0
var xs = 0

func _ready():
	for y in $"/root/Tiles".get_children():
		items.append([])
		for x in y.get_children():
			items[-1].append(nothing)
	items.remove(-1)
	

func _process(_delta):
	if storage != oldstorage:
		storage = []
		for i in items:
			if i["id"] == "storage":
				storage.append(i)
	oldstorage = storage

func get_image_by_id(id: String):
	return load("res://Images/Full/"+id+".svg")

func get_scene_as_node_by_id(id: String):
	return load("res://Scenes/Items/"+id+".tscn").instance()

func _input(_event):
	var num_keys = [KEY_1, KEY_2, KEY_3, KEY_4, KEY_5, KEY_6, KEY_7, KEY_8, KEY_9]
	for i in num_keys:
		if Input.is_key_pressed(i):
			if Input.is_key_pressed(KEY_I):
				if len(storage) > num_keys.find(i):
					t = num_keys.find(i)
			else:
				selected_item = storage[t]["inventory"][num_keys.find(i)]
				print("t: "+str(t)+" item: "+str(selected_item))

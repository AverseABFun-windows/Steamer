extends Node

var staticmaterial = {
	"inventory_length":0, 
	"propreties":{
		"noin":1, 
		"noout":1, 
		"canplace":0,
		"change_table":{}
	}
}

var types = {
	"iron":staticmaterial,
	"iron_ore":staticmaterial,
	"gold":staticmaterial,
	"gold_ore":staticmaterial,
	"elec":staticmaterial,
	"elec_ore":staticmaterial,
	"power":staticmaterial,
	"crafter":{
		"inventory_length":5, 
		"propreties":{
			"noin":0, 
			"noout":0, 
			"canplace":1,
			"change_table":{
				["iron:5"]:["miner", "smelter"], 
				["iron:2"]:["pipe"]
			}
		}
	}, "pipe":{
		"inventory_length":1, 
		"propreties":{
			"noin":0, 
			"noout":0, 
			"canplace":1,
			"change_table":{
				["*"]:["*"]
			}
		}
	}, "generator:wind":{
		"inventory_length":1, 
		"propreties":{
			"noin":1, 
			"noout":0, 
			"canplace":1,
			"change_table":{
				[""]:["power"]
			}
		}
	}, "storage":{
		"inventory_length":9, 
		"propreties":{
			"noin":0, 
			"noout":0, 
			"canplace":1,
			"change_table":{
				["*"]:["inventory+*"]
			}
		}
	}, "miner":{
		"inventory_length":6, 
		"propreties":{
			"noin":0, 
			"noout":0, 
			"canplace":1,
			"change_table":{
				["power"]:["{random_ore}"]
			}
		}
	}, "smelter":{
		"inventory_length":2, 
		"propreties":{
			"noin":0, 
			"noout":0, 
			"canplace":1,
			"change_table":{
				["iron_ore", "power"]:["iron"],
				["gold_ore", "power"]:["gold"],
				["elec_ore", "power"]:["elec"],
			}
		}
	}
}

var ores = ["iron_ore", "gold_ore", "elec_ore"]

func change_parser(table: Dictionary, item: Array): 
	for key in table: 
		if key == item: return table[key]
	return false

func exec_out_change_string(_in: String, type: String):
	var out = types[type]["propreties"]["change_table"]
	var ret = []
	for i in out:
		randomize()
		var ore_index:int = randi() % ores.size()
		i.replace("{random_ore}", ores[ore_index])
		if "inventory+*" == i:
			Player.storage[-1]["inventory"].append(_in)
			i.replace("inventory+*", "")
			continue
		if "*" == i:
			i.replace("*", _in)
		ret.append(i)
	return ret

func exec_item(_in: Array, type: String):
	var full_type = types[type]
	var t = 0
	for i in _in:
		if i in full_type["propreties"]["change_table"]:
			t += 1
	if t != len(_in): return []
	var out = []
	for i in _in:
		out.append(exec_out_change_string(i, type))
	return out
	

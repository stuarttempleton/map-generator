extends Control


export var MapDetailBoilerPlate = "Biome: %s"

var Name = ""
var Type = ""
var Seed = ""

func _ready():
	GenerateRandom()


func _generate_planet_map(_seed, _name, _type):
	$PlanetMap.visible = true
	$PlanetMap._generate(_seed, _name, _type)

func SetSeed(_seed):
	Seed = _seed
	print("New seed: " + str(Seed))

func SetName(_name):
	if (_name == ""): _name = WordGenerator.CreateWord()
	Name = _name
	$PlanetName.text = Name


func SetType(_type):
	if (_type == ""): _type = $PlanetMap.PlanetGradientMaps.keys()[randi() % $PlanetMap.PlanetGradientMaps.keys().size() - 1]
	Type = _type
	$PlanetInformation.text = MapDetailBoilerPlate % [_type]


func GenerateRandom():
	SetName("")
	SetType("")
	_generate_planet_map(-1, Name, Type)
	SetSeed($PlanetMap.SeedNumber)


func _on_Save_pressed():
	var save_path = "user://world_map_%s_%s.png" %[Name, Type]
	$UI.hide()
	
	yield(get_tree().create_timer(0.5), "timeout")
	
	var img = get_viewport().get_texture().get_data()
	img.flip_y()
	if img.save_png(save_path) != OK:
		print("Error saving file")
	else:
		print("File saved to ", save_path)
	$UI.show()
	$SavedMessage.show()
	yield(get_tree().create_timer(1.5), "timeout")
	$SavedMessage.hide()
	pass # Replace with function body.


func _on_Random_pressed():
	GenerateRandom()


func _on_New_Map_pressed():
	_generate_planet_map(-1, Name, Type)


func _on_New_Name_pressed():
	SetName("")


func _on_New_Biome_pressed():
	SetType("")
	_generate_planet_map(-1, Name, Type)

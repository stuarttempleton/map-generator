extends Control


export var MapDetailBoilerPlate = "Type: %s"

func _ready():
	
	_generate_planet_map(-1, "", "")
	pass



func _generate_planet_map(_seed, _name, _type):
	
	if (_name == ""): _name = WordGenerator.CreateWord()
	if (_type == ""): _type = $PlanetMap.PlanetGradientMaps.keys()[randi() % $PlanetMap.PlanetGradientMaps.keys().size() - 1]
		
	$PlanetMap.visible = true
	$PlanetName.text = _name
	$PlanetInformation.text = MapDetailBoilerPlate % [_type]
	$PlanetMap._generate(_seed, _name, _type)


func _on_generate_button_pressed(planet_type):
	$PlanetSurfaceMap/PlanetMap._generate(-1, "", planet_type)

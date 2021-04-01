extends Control


export var MapDetailBoilerPlate = "Type: %s"

func _ready():
	
	#_generate_planet_map(StarMapData.GetRandomPlanetByType("Comet"), 100)
	_generate_planet_map(-1, "Test Map", "Desert")
	pass



func _generate_planet_map(_seed, _name, _type):
	
	$PlanetMap.visible = true
	$PlanetName.text = _name
	$PlanetInformation.text = MapDetailBoilerPlate % [_type]
	$PlanetMap._generate(_seed, _name, _type)


func _on_generate_button_pressed(planet_type):
	$PlanetSurfaceMap/PlanetMap._generate(-1, "Test Map", planet_type)

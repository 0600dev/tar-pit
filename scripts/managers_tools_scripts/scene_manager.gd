extends Node2D
#
# scene states
enum Scenes {TEMPLE, DESERT, DESERT_ETC, CITY_CENTER, BARRACKS, BAKERY, SLUMS}
# setting the scene state manager to the temple scene
@onready var scene : Scenes = Scenes.TEMPLE
# scenes

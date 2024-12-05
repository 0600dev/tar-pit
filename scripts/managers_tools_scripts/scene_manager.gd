extends Node2D
class_name SceneManager
#
# scene states
enum Scenes {TEMPLE, DESERT, DESERT_ETC, CITY_CENTER, BARRACKS, BAKERY, SLUMS}
# setting the scene state manager to the temple scene
@onready var scene : Scenes = Scenes.TEMPLE
# scenes
@onready var temple_scene = $scenes/temple_scene
@onready var desert_scene = $scenes/desert_scene
@onready var desert_etc_scene = $scenes/desert_etc_scene
# arrows
@onready var left_arrow = $arrows/left_arrow
@onready var right_arrow = $arrows/right_arrow
@onready var up_arrow = $arrows/up_arrow
@onready var down_arrow = $arrows/down_arrow
# audio
@onready var arrow_sfx = $audio_manager/arrow_sfx
# dialogue
@export_category("Dialogue")
var is_talking : bool = false
# inputmap
var kash_input
var captain_input


func _ready():
	# scene visibility
	temple_scene.visible = false
	desert_scene.visible = false
	desert_etc_scene.visible = false
	# arrow visibility
	left_arrow.visible = false
	right_arrow.visible = false
	up_arrow.visible = false
	down_arrow.visible = false
	# disable input keys
	kash_input = InputMap.action_get_events("kash")
	InputMap.action_erase_events("kash")
	captain_input = InputMap.action_get_events("captain")
	InputMap.action_erase_events("captain")
	

	
func _scene_state():

	if scene == Scenes.TEMPLE:
		# scene sprite visibilty
		temple_scene.visible = true
		desert_scene.visible = false
		desert_etc_scene.visible = false
		# arrow visibility and position in scene
		left_arrow.visible = false
		right_arrow.visible = false
		up_arrow.visible = true
		up_arrow.global_position = Vector2(640, 0)
		down_arrow.visible = false
		
		
	if scene == Scenes.DESERT:
		temple_scene.visible = false
		desert_scene.visible = true
		desert_etc_scene.visible = false
		#
		left_arrow.visible = false
		right_arrow.visible = true
		up_arrow.visible = false
		down_arrow.visible = true
		down_arrow.global_position = Vector2(640, 450)
		#
		
		
	if scene == Scenes.DESERT_ETC:
		temple_scene.visible = false
		desert_scene.visible = false
		desert_etc_scene.visible = true
		#
		left_arrow.visible = true
		right_arrow.visible = false
		up_arrow.visible = false
		down_arrow.visible = false
		#
		for input_event in kash_input:
			InputMap.action_add_event("kash", input_event)
		for input_event in captain_input:
			InputMap.action_add_event("captain", input_event)
		#
		
		
func _process(_delta):
	_scene_state()


func _on_left_arrow_pressed():
	# arrow sound effect
	arrow_sfx.play()
	#
	if scene == Scenes.DESERT_ETC:
		scene = Scenes.DESERT
		

func _on_right_arrow_pressed():
	arrow_sfx.play()
	#
	if scene == Scenes.DESERT:
		scene = Scenes.DESERT_ETC
		
	elif scene == Scenes.DESERT_ETC:
		scene = Scenes.CITY_CENTER

func _on_up_arrow_pressed():
	arrow_sfx.play()
	#
	if scene == Scenes.TEMPLE:
		scene = Scenes.DESERT

func _on_down_arrow_pressed():
	arrow_sfx.play()
	#	
	if scene == Scenes.DESERT:
		scene = Scenes.TEMPLE

	

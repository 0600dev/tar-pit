extends Node2D
class_name GameManager
#
var dialogue_states : DialogueStates
# portrait
enum Portraits {TAR_SPIRIT, KASH, CAPTAIN}
@onready var portrait : Portraits = Portraits.TAR_SPIRIT
@onready var portrait_pic = $CanvasGroup/portrait/portrait_pic
# items 
@export_category("Inventory Items")
@onready var items = $CanvasGroup/inventory/items
@onready var coin_purse = $CanvasGroup/inventory/items/coin_purse
@onready var paddle_doll = $CanvasGroup/inventory/items/paddle_doll
@onready var sword_shotel = $CanvasGroup/inventory/items/sword_shotel
@onready var sword_takoba = $CanvasGroup/inventory/items/sword_takoba
@onready var water_gourd = $CanvasGroup/inventory/items/water_gourd
# dialogue
@export var dialogue_resource : DialogueResource
var dialogue_start : String = "start"
# events
@onready var orc_scene_change = $orb_scene_change


func _ready():
	# portrait animation
	portrait_pic.play("nothing")
	# first dialogue
	DialogueManager.show_dialogue_balloon(dialogue_resource, "temple_scene_start")
	#item visibility
	coin_purse.visible = false
	paddle_doll.visible = false
	sword_shotel.visible = false
	sword_takoba.visible = false
	water_gourd.visible = false
	
func _process(_delta):
	# quit to start menu on exit
	if Input.is_action_pressed("escape"):
		get_tree().change_scene_to_file("res://scenes/menus_scenes/start_menu.tscn")
		AudioServer.set_bus_mute(0, false)
		
	# change portrait selection on button press
	if Input.is_action_just_pressed("tar spirit"):
		portrait = Portraits.TAR_SPIRIT
	elif Input.is_action_just_pressed("kash"):
		portrait = Portraits.KASH
	elif Input.is_action_just_pressed("captain"):
		portrait = Portraits.CAPTAIN
		
	#
	_portrait_state()
		
	
func _portrait_state():
	if portrait == Portraits.TAR_SPIRIT:
		# play tar spirit animation if tar spirit
		portrait_pic.play("tar_spirit_idle")
		# item visibily; for loop attempted, didn't work
		#
	
	elif portrait == Portraits.KASH:
		portrait_pic.play("kash")
		#
		coin_purse.visible = false
		paddle_doll.visible = false
		sword_shotel.visible = true
		sword_takoba.visible = false
		water_gourd.visible = true

		# play dialogue if this character
		DialogueManager.show_dialogue_balloon(dialogue_resource, "desert_dialogue")
		
	elif portrait == Portraits.CAPTAIN:
		portrait_pic.play("captain")
		#
		coin_purse.visible = true
		paddle_doll.visible = true
		sword_shotel.visible = false
		sword_takoba.visible = true
		water_gourd.visible = false

		

func _on_coin_purse_pressed():
	# turn off texture alpha 
	coin_purse.self_modulate.a = 0
	# disable button
	coin_purse.disabled = true
	# play "wrong item" dialogue
	DialogueManager.show_dialogue_balloon(dialogue_resource, "wrong_item")

func _on_paddle_doll_pressed():
	paddle_doll.self_modulate.a = 0
	#
	paddle_doll.disabled = true
	# play "right item" dialogue
	DialogueManager.show_dialogue_balloon(dialogue_resource, "right_item")

func _on_sword_shotel_pressed():
	sword_shotel.self_modulate.a = 0
	#
	sword_shotel.disabled = true
	#
	DialogueManager.show_dialogue_balloon(dialogue_resource, "wrong_item")

func _on_sword_takoba_pressed():
	sword_takoba.self_modulate.a = 0
	#
	sword_takoba.disabled = true
	#
	DialogueManager.show_dialogue_balloon(dialogue_resource, "wrong_item")

func _on_water_gourd_pressed():
	water_gourd.self_modulate.a = 0
	#
	
	#
	DialogueManager.show_dialogue_balloon(dialogue_resource, "wrong_item")



func _on_orb_scene_change_gui_input(event):	
	# play "item brought" dialogue on play
	if Input.is_action_just_pressed("interact"):
	# make all buttons visible
		coin_purse.visible = true
		paddle_doll.visible = true
		sword_shotel.visible = true
		sword_takoba.visible = true
		water_gourd.visible = true	
	# play "item brought" dialogue on play	
		DialogueManager.show_dialogue_balloon(dialogue_resource, "item_brought")
	

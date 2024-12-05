extends Node2D
class_name GameManager
#
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
# events
@onready var orc_scene_change = $orb_scene_change
# screenchange
var is_fullscreen : bool = false
@onready var fullscreen_button 
@export_category("Screen Change")
@export var fullscreen_texture : Texture2D
@export var windowed_texture : Texture2D



func _ready() -> void:
	# portrait animation
	portrait_pic.play("nothing")
	# first dialogue
	#item visibility
	coin_purse.visible = false
	paddle_doll.visible = false
	sword_shotel.visible = false
	sword_takoba.visible = false
	water_gourd.visible = false
	
	
func _process(_delta) -> void:
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
		
	# fullscreen/minimize button change

			
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


func _on_paddle_doll_pressed():
	paddle_doll.self_modulate.a = 0
	#
	paddle_doll.disabled = true
	# play "right item" dialogue


func _on_sword_shotel_pressed():
	sword_shotel.self_modulate.a = 0
	#
	sword_shotel.disabled = true
	#


func _on_sword_takoba_pressed():
	sword_takoba.self_modulate.a = 0
	#
	sword_takoba.disabled = true
	#


func _on_water_gourd_pressed():
	water_gourd.self_modulate.a = 0
	#




func _on_orb_scene_change_gui_input():	
	# play "item brought" dialogue on play
	if Input.is_action_just_pressed("interact"):
	# make all buttons visible
		coin_purse.visible = true
		paddle_doll.visible = true
		sword_shotel.visible = true
		sword_takoba.visible = true
		water_gourd.visible = true	
	# play "item brought" dialogue on play	

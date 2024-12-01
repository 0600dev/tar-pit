extends Node
#
var game_manager : GameManager
#
var has_items : String = ""
var char_status : String = ""


func _process(_delta):
	pass

func _on_death():
	# wait after dialogue then quit game
	await get_tree().create_timer(1).timeout
	get_tree().quit()

func _timeout():
	# dialogue pause
	await get_tree().create_timer(1).timeout

	

extends Control


func _on_play_pressed():
	# change to game scene
	get_tree().change_scene_to_file("res://scenes/managers_tools_scenes/game_manager.tscn")


func _on_volume_pressed():
	# mute and un-mute volume
	AudioServer.set_bus_mute(0, not AudioServer.is_bus_mute(0))


func _on_quit_pressed():
	# quit
	get_tree().quit()


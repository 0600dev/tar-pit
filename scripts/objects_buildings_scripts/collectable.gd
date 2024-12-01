extends Control
class_name Collectable


func _on_gui_input(event):
	if event.is_action_pressed("interact"):
		get_parent().queue_free()

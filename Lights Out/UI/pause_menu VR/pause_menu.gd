extends Control




func _ready():
	pass




func _on_resume_game_pressed():
	get_tree().get_nodes_in_group("vrPause")[0].visible = false
	get_tree().paused = false


func _on_quit_game_pressed():
	get_tree().quit()

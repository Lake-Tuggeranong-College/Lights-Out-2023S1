extends Control

export(String) var scene_to_load

var is_paused = false setget set_is_paused
var mouseDelta : Vector2 = Vector2()
func _unhandled_input(event):
	if event.is_action_pressed("ui_menu"):
		self.is_paused = !is_paused
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused

func _on_resume_game_pressed():
	self.is_paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().change_scene("res://Maps/Map1.tscn")

func _on_quit_game_pressed():
	#get_tree().quit()
	get_tree().change_scene("res://Launcher.tscn")

func _input (event):
	if event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		#Did the mouse move?
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			mouseDelta = event.relative



#func _on_resume_game_pressed():
		#get_tree().change_scene("res://Maps/Map1.tscn")
		#var player = load("res://Assets/Desktop/Player/Player.tscn").instance()
		#add_child(player)
		#player.global_translation = $Spawn.global_translation
			


#func _on_quit_game_pressed():
	#get_tree().change_scene("res://Launcher.tscn")


#func _on_resume_game_pressed():
	#pass # Replace with function body.




extends Control

export(String) var scene_to_load

var is_paused = false
var mouseDelta : Vector2 = Vector2()
#
#func _unhandled_input(event):
#	if event.is_action_pressed("ui_menu"):
#		self.is_paused = !is_paused
		
func _input (event):
	if event.is_action_pressed("ui_menu"):
		set_is_paused(!is_paused)

func set_is_paused(value):
	if value:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused

func _on_resume_game_pressed():
	self.is_paused = false
	#get_tree().change_scene("res://Maps/Map1.tscn")
	get_tree().paused = false

func _on_quit_game_pressed():
	get_tree().quit()
	#get_tree().change_scene("res://Launcher.tscn")


func _on_Main_Menu_Button_pressed():
	get_tree().change_scene(scene_to_load)
	get_tree().paused = false

extends Control

func _on_Button_pressed():
	get_tree().change_scene("res://UI/Desktop/Main Menu.tscn")

func _on_Fullscreen_Checkbox_toggled(button_pressed):
		OS.set_window_fullscreen(!OS.window_fullscreen)

func _on_Debugger_Option_toggled(button_pressed):
	Global.debugPrivelege = true

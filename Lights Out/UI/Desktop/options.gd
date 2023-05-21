extends Control

var testSound = preload("res://Assets/Audio Files/UIconfirmationOptimistic_SFX.wav")
# BACK TO MAIN MENU
func _on_Button_pressed():
	get_tree().change_scene("res://UI/Desktop/Main Menu.tscn")

# VIDEO OPTIONS
func _on_Fullscreen_Checkbox_toggled(button_pressed):
		OS.set_window_fullscreen(!OS.window_fullscreen)

# GENERAL OPTIONS
func _on_Debugger_Option_toggled(button_pressed):
	Global.debugPrivelege = true

func _on_VSync_Option_toggled(button_pressed):
	OS.set_use_vsync(false)
	
func _on_FramerateCounter_toggled(button_pressed):
	Global.fpsCounterActive = true

func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)

func _on_Test_Sound_pressed():
	$TabContainer/Audio/VBoxContainer4/AudioStreamPlayer.play()

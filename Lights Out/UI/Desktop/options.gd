extends Control

var testSound = preload("res://Assets/Audio Files/UIconfirmationOptimistic_SFX.wav")
# BACK TO MAIN MENU

func _process(delta):
	$TabContainer/General/VBoxContainer/Debugger_Option.pressed = Global.debugPrivelege
	$TabContainer/Video/VBoxContainer3/FramerateCounter.pressed = Global.fpsCounterActive
	$TabContainer/General/VBoxContainer/V_Sync_Option.pressed = Global.vsync
	$TabContainer/Video/VBoxContainer3/FullscreenCheckbox.pressed = Global.fullscreenMode
	

	
func _on_Button_pressed():
	get_tree().change_scene("res://UI/Desktop/Main Menu.tscn")

# VIDEO OPTIONS
func _on_Fullscreen_Checkbox_toggled(button_pressed):
	Global.fullscreenMode = OS.set_window_fullscreen(!OS.window_fullscreen)
	Global.fullscreenMode = button_pressed

# GENERAL OPTIONS
func _on_Debugger_Option_toggled(button_pressed):
	Global.debugPrivelege = true
	Global.debugPrivelege = button_pressed

func _on_VSync_Option_toggled(button_pressed):
	Global.vsync = false
	OS.set_use_vsync(false)
	Global.vsync = button_pressed
	
func _on_FramerateCounter_toggled(button_pressed):
	Global.fpsCounterActive = true
	Global.fpsCounterActive = button_pressed

func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)

func _on_Test_Sound_pressed():
	$TabContainer/Audio/VBoxContainer4/AudioStreamPlayer.play()

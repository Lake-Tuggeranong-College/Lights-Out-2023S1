extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_VR_pressed():
	Global.vr = true
	get_tree().change_scene("res://UI/VR/Main Menu.tscn")


func _on_Desktop_pressed():
	Global.desktop = true
	get_tree().change_scene("res://UI/Desktop/Main Menu.tscn")
	#if Input.is_action_just_pressed("toggle_fullscreen"):
	OS.window_fullscreen = !OS.window_fullscreen
	


func _on_quit_pressed():
	get_tree().quit()

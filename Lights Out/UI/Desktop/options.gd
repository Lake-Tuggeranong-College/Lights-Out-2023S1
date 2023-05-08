extends Control

func _on_Button_pressed():
	get_tree().change_scene("res://UI/Desktop/Main Menu.tscn")


func _on_sonar_color_pressed():
	get_tree().change_scene("res://UI/other/sonar_color.tscn")

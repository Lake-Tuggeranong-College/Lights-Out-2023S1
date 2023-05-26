extends Control

func _ready():
	pass # Replace with function body.

func _on_StartGameButton_pressed():
	get_tree().change_scene("res://Maps/Map1.tscn")

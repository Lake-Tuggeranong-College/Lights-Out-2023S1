extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Play_pressed():
	get_tree().change_scene("res://Maps/Map1.tscn")


func _on_return_pressed():
	get_tree().change_scene("res://Launcher.tscn")


func _on_options_pressed():
	get_tree().change_scene("res://UI/Desktop/options.tscn")


func _on_Button_pressed():
		get_tree().change_scene("res://UI/other/credits.tscn")




extends CSGBox



#func _on_Area_area_entered(area):	
#	if cardTrue == true:
#		if area.name == ("trueCard"):
#			get_tree().change_scene("res://UI/Desktop/Main Menu.tscn")
#	print ("true")

#func _process(delta):
#	if cardReader == true:
#		if Input.is_action_just_pressed("left_click"):
#			var cardTrue = true
#			print ("input available")

#func _on_Area_area_exited(area):
#	cardReader = false
#	print ("false")

func _on_Area_area_entered(area):
	if area.is_in_group("trueCard"):
		if Input.is_action_pressed("left_click"):
			get_tree().change_scene("res://UI/Desktop/Main Menu.tscn")
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

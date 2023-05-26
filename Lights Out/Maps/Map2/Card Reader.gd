extends CSGBox

func _process(delta):
	if Global.cardReader == 4:
		get_tree().change_scene("res://UI/Desktop/WinScene.tscn")
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_Area_area_entered(area):
	if area.is_in_group("trueCard"):
		if Input.is_action_pressed("interact"):
			area.remove_from_group("trueCard")
			Global.cardReader += 1
			print (Global.cardReader)
	if area.is_in_group("falseCard"):
		Global.cardReader = 0
		print (Global.cardReader)

extends CSGBox

func _on_Area_area_entered(area):
	Global.cardReader = true
	print ("true")	

func get_input():
	if Global.cardReader == true:
		if Input.is_action_just_pressed("left_click"):
			print ("trueer")

func _on_Area_area_exited(area):
	Global.cardReader = false
	print ("false")

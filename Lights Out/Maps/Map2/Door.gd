extends CSGBox

func _on_Area_area_entered(area):
	Global.doorEntered = true
	print ("Door true")

func _on_Area_area_exited(area):
	Global.doorEntered = false
	print ("Door false")

func get_input():
	if Global.doorEntered == true:
		if Input.is_action_just_pressed("left_click"):
			queue_free()
			print ("Door Deleted")

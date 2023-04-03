extends CSGBox

func _on_Area_area_entered(area):
	Global.cardReader = true
	print ("true")	

func _on_Area_area_exited(area):
	Global.cardReader = false
	print ("false")

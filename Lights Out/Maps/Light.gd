extends MeshInstance



func _on_Area_area_entered(area):
	if area.name == "Player":
		print("good")
		Global.in_area = true

func _on_Area_area_exited(area):
	if area.name == "Player":
		print ("but")
		Global.in_area = false

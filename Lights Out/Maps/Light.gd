extends MeshInstance



func _on_Area_area_entered(area):
	print("good")
	Global.in_area = true

func _on_Area_area_exited(area):
	print ("but")
	Global.in_area = false

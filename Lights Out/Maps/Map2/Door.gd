extends CSGBox

var doorEntered = false

func _on_Area_area_entered(area):
	doorEntered = true

func _on_Area_area_exited(area):
	doorEntered = false

func _process(delta):
	if doorEntered == true:
		print (doorEntered)
		if Input.is_action_pressed("interact"):
			queue_free()

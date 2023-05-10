extends MeshInstance

func _input(event):
	if Input.is_action_just_pressed("left_click"):
		$Timer.start()
		self.visible = true;
		print ("joeldaism")


func _on_Timer_timeout():
	self.visible = false

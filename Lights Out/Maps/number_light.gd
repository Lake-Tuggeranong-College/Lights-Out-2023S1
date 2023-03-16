extends OmniLight

func _process(delta):
	if Global.in_area == true:
		self.visible = true;
		print("it")
	if Global.in_area == false:
		self.visible = false;
		print ("can be better")

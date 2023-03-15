extends OmniLight

func _process(delta):
	if Global.in_area == true:
		$OmniLight/Enabled

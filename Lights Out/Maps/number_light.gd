extends OmniLight

onready var timer = $Player/Omnilight/Timer

func _input(event):
	if Global.in_area == true:
		if Input.is_action_just_pressed("left_click"):
			self.visible = true;
	if Global.in_area == false:
		self.visible = false;

func _on_Timer_timeout():
	self.visible = false;

extends OmniLight

onready var timer = $Player/Omnilight/Timer

func _input(event):
		if Input.is_action_just_pressed("left_click"):
			self.visible = true;

func _on_Timer_timeout():
	self.visible = false;

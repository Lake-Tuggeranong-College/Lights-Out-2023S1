extends MeshInstance

onready var timer = $Basement/Bookcases/StaticBody/CSGMesh2/MeshInstance/Timer

func _input(event):
	if Input.is_action_just_pressed("left_click"):
		$Timer.start()
		self.visible = true;
		print ("mumba")

func _on_Timer_timeout():
		self.visible = false

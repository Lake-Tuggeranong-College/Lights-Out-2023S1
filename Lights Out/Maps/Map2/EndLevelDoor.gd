extends CSGBox

func _ready():
	pass # Replace with function body.

func _on_Area_body_entered(body):
	if body.name == "AttackOnTitan_Key3" or body.name == "Pickable":
		self.queue_free()
		body.queue_free()
		Global.hasClicker = true


func _on_Area2_body_entered(body):
	pass # Replace with function body.

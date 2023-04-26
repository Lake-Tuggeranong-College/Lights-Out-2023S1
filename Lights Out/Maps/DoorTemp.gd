extends CSGBox

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Area_body_entered(body):
	if body.name == "AttackOnTitan_Key2" or body.name == "Pickable":
		self.queue_free()
		body.queue_free()
		Global.hasClicker = true

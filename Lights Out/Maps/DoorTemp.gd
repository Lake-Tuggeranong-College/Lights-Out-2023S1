extends MeshInstance

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Area_body_entered(body):
	if body.name == "AttackOnTitan_Key3" or body.name == "Pickable":
		self.get_parent().queue_free()
		body.queue_free()
		Global.hasClicker = true


func _on_Area2_body_entered(body):
	pass # Replace with function body.

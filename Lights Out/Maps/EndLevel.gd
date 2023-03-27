extends CSGBox

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Area_body_entered(body):
	if body.name == "Player":
		self.queue_free()
		body.queue_free()
		Global.hasClicker = true
		get_tree().change_scene("res://Maps/Map2/Map2.tscn")

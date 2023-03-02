extends Spatial

var gravity = -50
var velocity = Vector3()

func _physics_process(delta):
	velocity.y += gravity * delta

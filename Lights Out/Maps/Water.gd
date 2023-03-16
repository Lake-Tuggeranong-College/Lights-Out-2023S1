extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
#	droplet()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func droplet():
	$AudioStreamPlayer3D.emmit_sound("res://Assets/Audio Files/WaterDrip_SFX.wav")
	yield(get_tree().create_timer(3.0), "timeout")
	droplet()

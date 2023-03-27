extends AudioStreamPlayer3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	emmit_sound("res://Assets/Audio Files/DoorLockUnlocking_SFX.wav")

func emmit_sound(sound_file):
	print("its sound time")
	var sonar = load("res://Assets/Shader/sonar.tscn").instance()
	var sonarNode = add_child(sonar)
	var sfx = load(sound_file)
	$".".stream = sfx
	$".".play()
	yield(self,"finished")
	sonar.queue_free()



extends AudioStreamPlayer3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	emmit_sound("res://Assets/Audio Files/DoorLockUnlocking_SFX.wav")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func emmit_sound(sound_file):
	var sfx = load(sound_file) 
	self.stream = sfx
	self.play()

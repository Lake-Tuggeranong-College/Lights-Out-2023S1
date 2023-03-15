extends AudioStreamPlayer3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var radarShader = $Sonar/SonarPart2/MeshInstance.get_active_material(0)

# Called when the node enters the scene tree for the first time.
func _ready():
	radarShader.set_shader_param("interval",0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	emmit_sound("res://Assets/Audio Files/DoorLockUnlocking_SFX.wav")

func emmit_sound(sound_file):
	radarShader.set_shader_param("interval",35)
	var sfx = load(sound_file)
	$".".stream = sfx
	$".".play()
	yield(self,"finished")
	radarShader.set_shader_param("interval",0)


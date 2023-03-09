extends Spatial
export(String) var password
var opened = false


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.desktop == true:
		$RootNode/Keypad.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func open(enteredCode):
	print(password)
	print(enteredCode)
	if enteredCode == password:
		$RootNode/Safe_MainBody/Safe_Door.queue_free()
		$VirtualKeyboard.queue_free()
		opened = true
		$AudioStreamPlayer3D.emmit_sound("res://Assets/Audio Files/Safe_Unlock.wav")
		$SafeArea.queue_free()
		$RootNode/Keypad.queue_free()
		return(true)
	else:
		return(false)


func _on_Area_area_entered(area):
	if area.name == "Player" and Global.vr:
		$SpotLight.visible = true
		$VirtualKeyboard.visible = true
		$RootNode/Keypad.visible = false


func _on_Area_area_exited(area):
	if !opened and area.name == "Player" and Global.vr:
		$SpotLight.visible = false
		$VirtualKeyboard.visible = false
		$RootNode/Keypad.visible = true

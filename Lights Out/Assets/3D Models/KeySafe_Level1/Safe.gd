extends Spatial
export(String) var password
var opened = false


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


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
		$Area.queue_free()


func _on_Area_area_entered(area):
	if area.name == "Player":
		$VirtualKeyboard.visible = true


func _on_Area_area_exited(area):
	if !opened:
		$VirtualKeyboard.visible = false

extends CanvasLayer

export(NodePath) var buttonPath
onready var buttons = get_node(buttonPath)
var currentInput = []
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.desktop == true:
		$Background/Standard/ExitButton.visible = true
	for button in buttons.get_children():
		button.connect("pressed", self ,"onButton_Pressed", [button.button_function])
	
		
	
	
	
	
func onButton_Pressed(button_function):
	if button_function == "Backspace":
		currentInput.pop_back()
		updateCode()
	elif button_function == "Go":
		if get_tree().get_root().get_node("Spatial/Safe2").open($Background/Standard/LineEdit.text):
			$Background/Standard/LineEdit.text = "Unlocked!"
			yield(get_tree().create_timer(1.0), "timeout")
			self.visible = false
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			$Background/Standard/LineEdit.text = "Incorect"
			yield(get_tree().create_timer(1.0), "timeout")
			currentInput = []
			updateCode()
	else:
		currentInput.append(button_function)
		updateCode()

		
func updateCode():
	var currentInputString = ""
	for i in currentInput:
		currentInputString += i
	$Background/Standard/LineEdit.text = currentInputString

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ExitButton_pressed():
	self.visible = false

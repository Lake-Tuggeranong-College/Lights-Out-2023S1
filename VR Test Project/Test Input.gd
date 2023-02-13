extends SpotLight

onready var controller := ARVRHelpers.get_arvr_controller(self)
export (XRTools.Buttons) var button : int = XRTools.Buttons.VR_TRIGGER
var pressed = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	self.visible = pressed
	if controller and controller.get_is_active() and controller.is_button_pressed(button) and !pressed:
		print("Button Pressed")
		pressed = true
	if pressed:
		print("Is Held")
		if !controller.is_button_pressed(button):
			print("let go")
			pressed = false

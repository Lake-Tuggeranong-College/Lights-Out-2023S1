extends SpotLight


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var isButtonDown = false
var lightActive = false
onready var controller := ARVRHelpers.get_arvr_controller(self)
export (XRTools.Buttons) var click_button : int = XRTools.Buttons.VR_TRIGGER
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.desktop:
		desktopFlash()
	else:
		vrFlash()
		
func vrFlash():
	if controller and controller.get_is_active() and controller.is_button_pressed(click_button) and !isButtonDown and !lightActive:
		isButtonDown = true
		lightActive = true
		self.visible = true
		yield(get_tree().create_timer(5.0), "timeout")
		self.visible = false
		yield(get_tree().create_timer(5.0), "timeout")
		lightActive = false
	if controller and controller.get_is_active() and !controller.is_button_pressed(click_button):
		isButtonDown = false

func desktopFlash():
	if Input.is_action_just_pressed("flashlight") and !lightActive:
		lightActive = true
		self.visible = true
		yield(get_tree().create_timer(5.0), "timeout")
		self.visible = false
		yield(get_tree().create_timer(5.0), "timeout")
		lightActive = false

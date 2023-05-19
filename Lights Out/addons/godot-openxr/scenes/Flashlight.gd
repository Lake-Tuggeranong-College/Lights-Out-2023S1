extends SpotLight


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var isButtonDown = false
var lightActive = false
var coneOfLight = 15
var lightRange = 5
var flashlightOnTime = 0
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
	flashLight(delta)

		
func vrFlash():
	if controller and controller.get_is_active() and controller.is_button_pressed(click_button) and !isButtonDown:
		isButtonDown = true
		lightActive = !lightActive
	if controller and controller.get_is_active() and !controller.is_button_pressed(click_button):
		isButtonDown = false

func desktopFlash():
	if Input.is_action_just_pressed("flashlight"):
		self.visible = true
		lightActive != lightActive




func flashLight(delta):
	if lightActive:
		flashlightOnTime += delta
		$Tween.interpolate_property($".","spot_angle",30.0,10.0,10.0,Tween.TRANS_LINEAR,Tween.EASE_OUT)
		$Tween2.interpolate_property($".","spot_range",100.0,50.0,10.0,Tween.TRANS_LINEAR,Tween.EASE_OUT)
		$Tween.start()
		$Tween2.start()
	else:
		pass

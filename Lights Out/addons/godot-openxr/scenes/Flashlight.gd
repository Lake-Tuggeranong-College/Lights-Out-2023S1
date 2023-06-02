extends SpotLight


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var recharging = false

var isButtonDown = false
var lightActive = false
var coneOfLight = 27
var lightRange = 6
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
	if lightActive:
		flashlightOnTime += delta
		coneOfLight = spot_angle
		lightRange = spot_range

		
func vrFlash():
	if controller and controller.get_is_active() and controller.is_button_pressed(click_button) and !isButtonDown:
		isButtonDown = true
		self.visible = lightActive
		lightActive = !lightActive
		flashLight()
	if controller and controller.get_is_active() and !controller.is_button_pressed(click_button):
		isButtonDown = false

func desktopFlash():
	if Input.is_action_just_pressed("flashlight"):
		lightActive = !lightActive
		self.visible = lightActive
		flashLight()




func flashLight():
	if lightActive:
		var remainingFlashLightTime = (Global.battries * Global.battryLifeTime) - flashlightOnTime
		print(remainingFlashLightTime)
		$Tween.interpolate_property($".","spot_angle",coneOfLight,15.0,remainingFlashLightTime,Tween.TRANS_LINEAR,Tween.EASE_OUT)
		$Tween2.interpolate_property($".","spot_range",lightRange,50.0,remainingFlashLightTime,Tween.TRANS_LINEAR,Tween.EASE_OUT)
		$Tween.start()
		$Tween2.start()
	else:
		$Tween.stop_all()
		$Tween2.stop_all()

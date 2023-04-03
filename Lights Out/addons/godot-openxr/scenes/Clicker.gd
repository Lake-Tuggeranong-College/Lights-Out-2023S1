extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var isActive = false
onready var controller := ARVRHelpers.get_arvr_controller(self)
export (XRTools.Buttons) var click_button : int = XRTools.Buttons.VR_TRIGGER
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if controller and controller.get_is_active() and controller.is_button_pressed(click_button) and !isActive and Global.hasClicker:
		isActive = true
		if Global.in_area:
			$"../../OmniLight".visible = true
			$"../../OmniLight/Timer".start()
		$AudioStreamPlayer3D.emmit_sound("res://Assets/Audio Files/UIconfirmationOptimistic_SFX.wav")
	if controller and controller.get_is_active() and !controller.is_button_pressed(click_button):
		isActive = false

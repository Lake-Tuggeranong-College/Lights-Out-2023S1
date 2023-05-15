extends Spatial

var isActive = false

onready var controller := ARVRHelpers.get_arvr_controller(self)
export (XRTools.Buttons) var pause_button : int = XRTools.Buttons.VR_BUTTON_3
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var is_paused = false setget set_is_paused


func set_is_paused(value):
	print("awww yeah changiun pasuye")
	is_paused = value
	if is_paused:
		$"../../ARVRCamera/Viewport2Din3D".translation = Vector3(0,-0.321,-2.2)
	else:
		$"../../ARVRCamera/Viewport2Din3D".translation = Vector3(0,-0.321,1.768)
	get_tree().paused = is_paused

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if controller and controller.get_is_active() and controller.is_button_pressed(pause_button) and !isActive:
		isActive = true
		set_is_paused(!is_paused)
		
	if controller and controller.get_is_active() and !controller.is_button_pressed(pause_button) and isActive:
		isActive = false

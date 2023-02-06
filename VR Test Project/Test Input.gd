extends Node

onready var controller := ARVRHelpers.get_arvr_controller(self)
var teleport_button : int = XRTools.Buttons.VR_TRIGGER
var grabbing = false
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
	if controller and controller.get_is_active() and controller.is_button_pressed(teleport_button) and !grabbing:
		print("Pickup time")
		grabbing = true
	if grabbing:
		print("Is grabbing")
		if !controller.is_button_pressed(teleport_button):
			print("let go")
			grabbing = false

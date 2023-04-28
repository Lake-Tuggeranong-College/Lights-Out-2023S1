extends Spatial

var isActive = false

onready var controller := ARVRHelpers.get_arvr_controller(self)
export (XRTools.Buttons) var pause_button : int = XRTools.Buttons.VR_BUTTON_3
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var is_paused = false setget set_is_paused

func _unhandled_input(event):
	if event.is_action_pressed("ui_menu"):
		self.is_paused = !is_paused

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if controller and controller.get_is_active() and controller.is_button_pressed(pause_button):
		isActive = true
		
	if controller and controller.get_is_active() and !controller.is_button_pressed(pause_button):
		isActive = false
		get_tree().paused = false

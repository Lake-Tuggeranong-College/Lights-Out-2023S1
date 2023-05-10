extends KinematicBody

onready var camera = $Pivot/Camera

var gravity = -50
var max_speed = 10
var crouch_move_speed = 6
var crouch_speed = 20
var mouse_sensitivity = 0.005
var velocity = Vector3()
var isHolding = false

var default_height = 3.187
var crouch_height = 1.6

onready var pcap = $CollisionShape #The crouch key is shift by the way. - Cam

func _init():
	VisualServer.set_debug_generate_wireframes(true)	

func _input(event):
	if event is InputEventKey and Input.is_key_pressed(KEY_P):
		var vp = get_viewport()
		vp.debug_draw = (vp.debug_draw + 1 ) % 4

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func get_input():
	var input_dir = Vector3()
	if Input.is_action_just_pressed("ui_]"):
		get_tree().change_scene("res://Maps/Map2/Map2.tscn")
	if Input.is_action_just_pressed("left_click") and Global.hasClicker:
		$AudioStreamPlayer3D.emmit_sound("res://Assets/Audio Files/UIconfirmationOptimistic_SFX.wav")
	if Input.is_action_just_pressed("interact"):
		if $Pivot/Camera/RayCast.is_colliding():
			var raycastCollsions = $Pivot/Camera/RayCast.get_collider()
			if raycastCollsions.is_in_group("pickup"):
				if isHolding:
					isHolding = false
					reparent(raycastCollsions, get_tree().current_scene)
					raycastCollsions.global_transform.origin = $Pivot/Camera/ObjectPlace.global_transform.origin
				else:
					isHolding = true
					reparent(raycastCollsions,$Pivot/Camera/ObjectPlace)
					raycastCollsions.global_transform.origin = $Pivot/Camera/ObjectPlace.global_transform.origin
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Input.is_action_pressed("ui_forward"):
		input_dir += -global_transform.basis.z
		footstepSound()
		#Cameron and Bailey put in the emmitsound files of single footsteps for desktop player movement.
	if Input.is_action_pressed("ui_backward"):
		input_dir += global_transform.basis.z
		footstepSound()
	if Input.is_action_pressed("ui_strafe_left"):
		input_dir += -global_transform.basis.x
		footstepSound()
	if Input.is_action_pressed("ui_strafe_right"):
		input_dir += global_transform.basis.x
		footstepSound()
	input_dir = input_dir.normalized()
	return input_dir
	
	

func _unhandled_input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * mouse_sensitivity)
		$Pivot.rotate_x(-event.relative.y * mouse_sensitivity)
		$Pivot.rotation.x = clamp($Pivot.rotation.x, -1.2, 0.3)

func _physics_process(delta):
	if Input.is_action_just_pressed("left_click") and $CanvasLayer/Numpad.visible == false:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		velocity.y += gravity * delta
		var desired_velocity = get_input() *max_speed
		velocity.x = desired_velocity.x
		velocity.z = desired_velocity.z
		velocity = move_and_slide(velocity, Vector3.UP, true)
	if Input.is_action_just_pressed("ui_menu"):
		get_tree().change_scene("res://UI/pause_menu/pause_menu.tscn")


func _on_Area_area_entered(area):
	if area.name == "SafeArea":
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		$CanvasLayer/Numpad.visible = true


func reparent(child: Node, new_parent: Node):
	var old_parent = child.get_parent()
	old_parent.remove_child(child)
	new_parent.add_child(child)
	
func footstepSound():
	if !$footsteps.playing:
		$footsteps.play()

extends KinematicBody

onready var camera = $Pivot/Camera

var gravity = -30
var max_speed = 10
var mouse_sensitivity = 0.005
var velocity = Vector3()

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func get_input():
	var input_dir = Vector3()
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Input.is_action_pressed("ui_forward"):
		input_dir += -global_transform.basis.z
	if Input.is_action_pressed("ui_backward"):
		input_dir += global_transform.basis.z
	if Input.is_action_pressed("ui_strafe_left"):
		input_dir += -global_transform.basis.x
	if Input.is_action_pressed("ui_strafe_right"):
		input_dir += global_transform.basis.x
	input_dir = input_dir.normalized()
	return input_dir

func _unhandled_input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * mouse_sensitivity)
		$Pivot.rotate_x(-event.relative.y * mouse_sensitivity)
		$Pivot.rotation.x = clamp($Pivot.rotation.x, -1.2, 1.2)

func _physics_process(delta):
	velocity.y += gravity * delta
	var desired_velocity = get_input() *max_speed
	
	velocity.x = desired_velocity.x
	velocity.z = desired_velocity.z
	velocity = move_and_slide(velocity, Vector3.UP, true)


func _on_Area_area_entered(area):
	if area.name == "Safe":
		var safe = load("res://addons/godot-xr-tools/objects/keyboard/Numpad_2D.tscn").instance()
		add_child(safe)

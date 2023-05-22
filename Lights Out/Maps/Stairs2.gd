extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.vr:
		$StaticBody/VRCollisionShape.disabled = false
		$StaticBody/DesktopCollisionShape.disabled = true
	if Global.desktop:
		$StaticBody/VRCollisionShape.disabled = true
		$StaticBody/DesktopCollisionShape.disabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

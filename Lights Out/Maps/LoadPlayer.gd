extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.vr:
		print("loading vr")
		var player = load("res://addons/godot-openxr/scenes/first_person_controller_vr.tscn").instance()
		add_child(player)
	if Global.desktop:
		print("loading desktop")
		var player = load("Desktop Player goes here!").instance()
		add_child(player)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

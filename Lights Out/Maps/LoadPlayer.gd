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
		player.global_translation = $Spawn.global_translation
	if Global.desktop:
		print("loading desktop")
		var player = load("res://Assets/Desktop/Player/Player.tscn").instance()
		add_child(player)
		player.global_translation = $Spawn.global_translation
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

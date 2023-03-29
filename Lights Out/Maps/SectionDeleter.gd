extends Area
export(NodePath) var Section_Path
export(NodePath) var Blockade_Path
onready var Section_Node = get_node(Section_Path)
onready var Blockade_Node = get_node(Blockade_Path)
var isPlayerOut = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print(Section_Node)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.desktop:
		for i in self.get_overlapping_bodies():
			if i.name == "Player":
				if !isPlayerOut:
					delteSection()
	if Global.vr:
		for i in self.get_overlapping_areas():
			if i.name == "Player":
				if !isPlayerOut:
					delteSection()
				
func delteSection():
	Section_Node.queue_free()
	isPlayerOut = true
	Blockade_Node.visible = true
	Blockade_Node.set_use_collision(true)

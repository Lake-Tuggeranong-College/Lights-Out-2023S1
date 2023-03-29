extends Area
export(NodePath) var Section_Path
export(NodePath) var Blockade_Path
onready var Section_Node = get_node(Section_Path)
onready var Blockade_Node = get_node(Blockade_Path)
var isPlayer = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print(Section_Node)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self.get_overlapping_bodies():
		if self.get_overlapping_bodies()[0].name == "Player":
			if !isPlayer:
				print("ahh shit he out the clpsest")
				Section_Node.queue_free()
				isPlayer = true
				Blockade_Node.visible = true
				Blockade_Node.set_use_collision(true)

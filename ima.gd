extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(get_parent().get_node("fdBG").visible):
		rect_global_position.x = get_parent().get_node("fdBG").rect_global_position.x-340
		rect_global_position.y = get_parent().get_node("fdBG").rect_global_position.y-19
		visible = true
	elif(visible):
		visible = false;

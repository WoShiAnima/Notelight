extends VBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var title = ""
var desc = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	nina()
	
func nina():
	$HBoxContainer/HBoxContainer2/titleL.text = title
	# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_notwea_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed:
			get_parent().get_parent().get_parent().get_parent().get_parent().get_node("noteZone").visible = true
			var ae =  get_path() 
			get_parent().get_parent().get_parent().get_parent().get_parent().get_node("noteZone").nani(ae)

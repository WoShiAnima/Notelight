extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var title = ""
var desc = ""
var select = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func nani(index):
	$reminderBox/rtitle.text = get_node(index).title
	$reminderBox/rdesc.text = get_node(index).desc
	select = index
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_save_pressed():
	if(get_node_or_null(select) == null):
		print("nel")
		var eso = preload("res://notwea.tscn").instance()
		eso.title = str($reminderBox/rtitle.text)
		eso.desc = $reminderBox/rdesc.text
		get_parent().get_node("Panel/notas/zona/GridContainer").add_child(eso);
		select = ""
		visible = false;
	else:
		print("yes")
		var eso = get_node(select)
		eso.title = $reminderBox/rtitle.text
		eso.desc = $reminderBox/rdesc.text
		select = ""
		eso.nina()
		visible = false;


func _on_nosave_pressed():
	select = ""
	visible = false;


func _on_createNot_pressed():
	title = ""
	desc = ""
	$reminderBox/rtitle.text = title
	$reminderBox/rdesc.text = desc
	select = ""
	visible = true;


func _on_destroy_pressed():
	if(get_node_or_null(select) == null):
		visible = false
	else:
		var eso = get_node(select)
		eso.queue_free()
		visible = false

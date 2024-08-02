extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var title = ""
var desc = ""
var ae = Time.get_datetime_dict_from_system()
var timeDay = ae.day
var timeMonth = ae.month
var timeYear = ae.year
var timeHour = ae.hour
var timeMinute = ae.minute
var select = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func nani(index):
	$reminderBox/rtitle.text = get_node(index).title
	$reminderBox/rdesc.text = get_node(index).desc
	$reminderBox/sday.value = int(get_node(index).timeDay)
	$reminderBox/smonth.value = int(get_node(index).timeMonth)
	$reminderBox/syear.value = int(get_node(index).timeYear)
	$reminderBox/shour.value = int(get_node(index).timeHour)
	$reminderBox/sminute.value = int(get_node(index).timeMinute)
	select = index
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_save_pressed():
	if(get_node_or_null(select) == null):
		print("nel")
		var eso = preload("res://wea.tscn").instance()
		eso.title = str($reminderBox/rtitle.text)
		eso.desc = $reminderBox/rdesc.text
		eso.timeDay = $reminderBox/sday.value
		eso.timeMonth = $reminderBox/smonth.value
		eso.timeYear = $reminderBox/syear.value
		eso.timeHour = $reminderBox/shour.value
		eso.timeMinute = $reminderBox/sminute.value
		get_parent().get_node("Panel/alarmas/zona/GridContainer").add_child(eso);
		select = ""
		visible = false;
	else:
		print("yes")
		var eso = get_node(select)
		eso.title = $reminderBox/rtitle.text
		eso.desc = $reminderBox/rdesc.text
		eso.timeDay = $reminderBox/sday.value
		eso.timeMonth = $reminderBox/smonth.value
		eso.timeYear = $reminderBox/syear.value
		eso.timeHour = $reminderBox/shour.value
		eso.timeMinute = $reminderBox/sminute.value
		select = ""
		eso.nina()
		visible = false;


func _on_nosave_pressed():
	select = ""
	visible = false;


func _on_createRem_pressed():
	title = ""
	desc = ""
	ae = Time.get_datetime_dict_from_system()
	timeDay = ae.day
	timeMonth = ae.month
	timeYear = ae.year
	timeHour = ae.hour
	timeMinute = ae.minute
	$reminderBox/rtitle.text = title
	$reminderBox/rdesc.text = desc
	$reminderBox/sday.value = timeDay
	$reminderBox/smonth.value = timeMonth
	$reminderBox/syear.value = timeYear
	$reminderBox/shour.value = timeHour
	$reminderBox/sminute.value = timeMinute
	select = ""
	visible = true;


func _on_destroy_pressed():
	if(get_node_or_null(select) == null):
		visible = false
	else:
		var eso = get_node(select)
		eso.queue_free()
		visible = false

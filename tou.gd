extends VBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var title = ""
var desc = ""
var timeText = ""
var timeDay = 1
var timeMonth = 1
var timeYear = 1
var timeHour = 0
var timeMinute = 0
var utime = 0;
var alarm = false;
# Called when the node enters the scene tree for the first time.
func _ready():
	nina()

func nina():
	
	timeText = "⏲ " + str(timeDay) + "/" + str(timeMonth) + "/" + str(timeYear) + " - " + str(timeHour) + ":" + str(timeMinute)
	$HBoxContainer/HBoxContainer2/titleL.text = title
	$HBoxContainer/HBoxContainer2/timeL.text = timeText
	utime = Time.get_unix_time_from_datetime_dict({"day" : timeDay, "month" : timeMonth, "year" : timeYear, "hour" : timeHour, "minute" : timeMinute})

	# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if utime < (Time.get_unix_time_from_system() + (Time.get_time_zone_from_system().bias*60)) and !alarm:
		alarm = true;
		var eso = preload("res://alr.tscn").instance()
		eso.index = get_path()
		eso.get_node("title").text = title
		eso.get_node("desc").text = desc
		get_parent().get_parent().get_parent().get_parent().get_parent().get_node("alarm").add_child(eso);
func _on_wea_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed:
			get_parent().get_parent().get_parent().get_parent().get_parent().get_node("reminderZone").visible = true
			var ae =  get_path() 
			get_parent().get_parent().get_parent().get_parent().get_parent().get_node("reminderZone").nani(ae)

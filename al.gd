extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var index = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_dest_pressed():
	get_parent().get_parent().get_node(index).queue_free()
	queue_free()


func _on_post_pressed():
	var nana = get_parent().get_parent().get_node(index)
	var jeje = (Time.get_unix_time_from_system() + $postCant.value*60) + (Time.get_time_zone_from_system().bias*60)
	var di = Time.get_datetime_dict_from_unix_time(jeje)
	nana.timeDay = di.day
	nana.timeMonth = di.month
	nana.timeYear = di.year
	nana.timeHour = di.hour
	nana.timeMinute = di.minute
	nana.nina()
	nana.alarm = false;
	queue_free()

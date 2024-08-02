extends GridContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _notification(what):
	if what == NOTIFICATION_WM_QUIT_REQUEST:
		_savefile()
		
func _savefile():
	var i = 0
	var cac = "@starting"
	while(i < get_child_count()):
		cac += "\n@node-start"
		var nod = get_child(i)
		cac += "\n@node-title\n"
		cac +=str(nod.title)
		cac += "\n@node-desc\n"
		cac +=str(nod.desc)
		cac += "\n@node-timeDay\n"
		cac +=str(nod.timeDay)
		cac += "\n@node-timeMonth\n"
		cac +=str(nod.timeMonth)
		cac += "\n@node-timeYear\n"
		cac +=str(nod.timeYear)
		cac += "\n@node-timeHour\n"
		cac +=str(nod.timeHour)
		cac += "\n@node-timeMinute\n"
		cac +=str(nod.timeMinute)
		cac += "\n@node-end"
		i+=1;
	cac += "\n@closing"
	var ara = File.new()
	ara.open("user://notif.sav", File.WRITE)
	ara.store_string(cac)
	ara.close()

extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var calor = Color("1b1b1b");

# Called when the node enters the scene tree for the first time.
func _ready():
	var file = File.new()
	get_tree().connect("files_dropped", self, "_on_files_dropped")
	if(file.file_exists("user://color.sav")):
		file.open("user://color.sav", File.READ)
		var content = file.get_as_text()
		calor = Color(content);
		$Panel/alarmas/zona2.color = calor
		$Panel/notas/zona2.color = calor
		$reminderZone/ColorRect.color = calor
		$noteZone/ColorRect.color = calor
		$reminderZone/reminderBox.color = calor
		$noteZone/reminderBox.color = calor
		$options/ColorPickerButton.color = calor
		file.close()
		
	if(file.file_exists("user://bg.sav")):
		file.open("user://bg.sav", File.READ)
		var content = file.get_as_text()
		var texture = ImageTexture.new()
		var image = Image.new()
		image.load(content)
		texture.create_from_image(image)
		$Panel/TextureRect.set_texture(texture)
		file.close()
	file = File.new()
	if(file.file_exists("user://music.sav")):
		file.open("user://music.sav", File.READ)
		var content = file.get_as_text()
		var music = $alarm/ColorRect/AudioStreamPlayer
		var pat = content
		var audio_loader = AudioLoader.new()
		music.set_stream(audio_loader.loadfile(pat))
	#	#music.volume_db = 0
	#	#music.pitch_scale = 1
		music.stream.loop = true;
		file.close()
	file = File.new()
	var eso;
	if(file.file_exists("user://notif.sav")):
		file.open("user://notif.sav", File.READ)
		var content = file.get_line()
		while(content != "@closing"):
			if(content == "@starting"):
				content = file.get_line()
			elif(content == "@node-start"):
				eso = preload("res://wea.tscn").instance()
				content = file.get_line()
			elif(content == "@node-end"):
				get_node("Panel/alarmas/zona/GridContainer").add_child(eso);
				content = file.get_line()
			elif(content == "@node-title"):
				content = file.get_line()
				while(!content.begins_with("@")):
					eso.title += content
					content = file.get_line()
					if(!content.begins_with("@")):
						eso.title += "\n"
			elif(content == "@node-desc"):
				content = file.get_line()
				while(!content.begins_with("@")):
					eso.desc += content
					content = file.get_line()
					if(!content.begins_with("@")):
						eso.desc += "\n"
			elif(content == "@node-timeDay"):
				content = file.get_line()
				eso.timeDay = content
				content = file.get_line()
			elif(content == "@node-timeMonth"):
				content = file.get_line()
				eso.timeMonth = content
				content = file.get_line()
			elif(content == "@node-timeYear"):
				content = file.get_line()
				eso.timeYear = content
				content = file.get_line()
			elif(content == "@node-timeHour"):
				content = file.get_line()
				eso.timeHour = content
				content = file.get_line()
			elif(content == "@node-timeMinute"):
				content = file.get_line()
				eso.timeMinute = content
				content = file.get_line()
		file.close()
	file = File.new()
	var esu;
	if(file.file_exists("user://notes.sav")):
		file.open("user://notes.sav", File.READ)
		var content = file.get_line()
		while(content != "@closing"):
			if(content == "@starting"):
				content = file.get_line()
			elif(content == "@node-start"):
				esu = preload("res://notwea.tscn").instance()
				content = file.get_line()
			elif(content == "@node-end"):
				get_node("Panel/notas/zona/GridContainer").add_child(esu);
				content = file.get_line()
			elif(content == "@node-title"):
				content = file.get_line()
				while(!content.begins_with("@")):
					esu.title += content
					content = file.get_line()
					if(!content.begins_with("@")):
						esu.title += "\n"
			elif(content == "@node-desc"):
				content = file.get_line()
				while(!content.begins_with("@")):
					esu.desc += content
					content = file.get_line()
					if(!content.begins_with("@")):
						esu.desc += "\n"
		file.close()

func _on_files_dropped(files, screen):
	print(files)
	var filed = files[0].get_extension()
	if(filed == "png" or filed == "jpg" or filed == "jpeg" or filed == "webp" or filed == "bmp"):
		var texture = ImageTexture.new()
		var image = Image.new()
		#if(files[i].get_)
		image.load(files[0])
		texture.create_from_image(image)
		$Panel/TextureRect.set_texture(texture)
		var ara = File.new()
		ara.open("user://bg.sav", File.WRITE)
		ara.store_string(files[0])
		ara.close()
	if(filed == "mp3" or filed == "ogg"):
		var music = $alarm/ColorRect/AudioStreamPlayer
		var pat = files[0]
		var audio_loader = AudioLoader.new()
		music.set_stream(audio_loader.loadfile(pat))
	#	#music.volume_db = 0
	#	#music.pitch_scale = 1
		music.stream.loop = true;
		var ara = File.new()
		ara.open("user://music.sav", File.WRITE)
		ara.store_string(files[0])
		ara.close()
	if(filed == "txt"):
		var fili = File.new();
		fili.open(str(files[0]), File.READ)
		var eso = preload("res://notwea.tscn").instance()
		eso.title = files[0].get_file().replace(".txt","")
		eso.desc = fili.get_as_text()
		get_node("Panel/notas/zona/GridContainer").add_child(eso);
		fili.close()


func _on_ColorPickerButton_color_changed(color):
	$Panel/alarmas/zona2.color = color
	$Panel/notas/zona2.color = color
	$reminderZone/ColorRect.color = color
	$noteZone/ColorRect.color = color
	$reminderZone/reminderBox.color = color
	$noteZone/reminderBox.color = color
	calor = color;


func _notification(what):
	if what == NOTIFICATION_WM_QUIT_REQUEST:
		var ara = File.new()
		ara.open("user://color.sav", File.WRITE)
		ara.store_string(str(calor.to_html(false)))
		ara.close()
		$exit.start(1.0)
		$exitprogramtrans.na = true;


func _on_Timer_timeout():
	$Panel/alarmas/zona/GridContainer._savefile()
	$Panel/notas/zona/GridContainer._savefile()
	print("saved")


func _on_exit_timeout():
	get_tree().quit()
	print("end")

extends FileDialog


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	set_filters(PoolStringArray(["*.mp3;","*.ogg"]));

func _on_fdMs_file_selected(path):
	var music = get_parent().get_parent().get_node("alarm/ColorRect/AudioStreamPlayer")
	var pat = path
	var audio_loader = AudioLoader.new()
	music.set_stream(audio_loader.loadfile(pat))
#	#music.volume_db = 0
#	#music.pitch_scale = 1
	music.stream.loop = true;
	var ara = File.new()
	ara.open("user://music.sav", File.WRITE)
	ara.store_string(path)
	


func _on_appc3_button_up():
	popup_centered()

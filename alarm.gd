extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_child_count() <= 1:
		if $ColorRect/AudioStreamPlayer.playing:
			$ColorRect/AudioStreamPlayer.stop()
			OS.set_window_always_on_top(false)
		visible = false
	else:
		if !$ColorRect/AudioStreamPlayer.playing:
			$ColorRect/AudioStreamPlayer.playing = true;
			OS.set_window_always_on_top(true)
		visible = true

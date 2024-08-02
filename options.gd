extends Popup


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rect_position.x = OS.window_size.x-129
	rect_position.y = OS.window_size.y-128


func _on_ColorPickerButton2_pressed():
	popup()
	pass

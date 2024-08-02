extends FileDialog


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var nan;

# Called when the node enters the scene tree for the first time.
func _ready():
	set_filters(PoolStringArray(["*.png;","*.jpg","*.jpeg","*.webp","*.bmp"]));
	nan = current_path

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if visible:
		if!(nan == current_path):
			var texture = ImageTexture.new()
			var image = Image.new()
			image.load(current_path)
			texture.create_from_image(image)
			get_parent().get_node("Panel/TextureRect").set_texture(texture)
		nan = current_path


func _on_appc2_pressed():
	popup_centered()
	rect_position.x += 170

func _on_fdBG_file_selected(path):
	var texture = ImageTexture.new()
	var image = Image.new()
	#if(files[i].get_)
	image.load(path)
	texture.create_from_image(image)
	get_parent().get_parent().get_node("Panel/TextureRect").set_texture(texture)
	var ara = File.new()
	ara.open("user://bg.sav", File.WRITE)
	ara.store_string(path)

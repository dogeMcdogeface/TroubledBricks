@tool
extends Label

@export var maxFontSize = 40  # Adjust this value as needed
@export var minFontSize = 20   # Minimum font size you want

func _ready():
	set_process(true)

func _process(delta):
	pass


func resize_to_fit():
	add_theme_font_size_override("font_size", maxFontSize)
	var size = get_theme_font_size ( "font_size","")
	while get_line_count ( ) > get_visible_line_count ( ) && size>=minFontSize:
		size = get_theme_font_size ( "font_size","")
		add_theme_font_size_override("font_size", size-1)

func _set(k, v):
	if "text" == k:
		resize_to_fit()
		# Do something

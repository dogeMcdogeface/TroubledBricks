extends Control

var timer
var timer_format = "%1.2f"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timer.is_inside_tree() and !timer.is_stopped():
		visible = true
		var time_left = timer.time_left
		$Label.text =  timer_format % time_left
	else:
		visible = false
	
	pass


func display_timer(pre_game_timer: Timer):
	timer = pre_game_timer

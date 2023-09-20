extends Node
class_name Player

var id = -1
var nickname: String = ""
var color_index: int = 0
var connected: bool = false
var keyboard: bool = false
var device_id = null
var device_name: String = ""


func get_nick():
	if nickname.is_empty():
		return "Player " + str(id+1)
	return nickname


func _ready():pass 
func _process(delta):pass

func set_color(direction):
	color_index = (color_index+direction)%Type.colors.size()



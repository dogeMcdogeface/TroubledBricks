extends Control


func _ready():
	for i in range($GridContainer.get_child_count()): 
		$GridContainer.get_child(i).set_index(i)


func _process(delta):pass


func _unhandled_input(event):
	if Players.has_device(event.device) and Input.is_action_pressed("Exit"):
		Players.disconnect_player(event.device)
	elif event.is_pressed() and ( event is InputEventKey or event is InputEventJoypadButton):
		Players.connect_player(event.device)


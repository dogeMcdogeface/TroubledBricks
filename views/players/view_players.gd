extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(Players.players[0])
	for i in range($GridContainer.get_child_count()): 
		var child = $GridContainer.get_child(i)
		child.get_node("VBoxContainer/name").text = Players.players[i].name
		child.get_node("VBoxContainer/device").text = str(Players.players[i].device_name)
	pass


func _input(event):

	if event is InputEventKey:
		event.set_device(Type.KEYBOARD)

	if Players.has_device(event.device) and Input.is_action_pressed("Exit"):
		Players.disconnect_player(event.device)
	elif event.is_pressed() and ( event is InputEventKey or event is InputEventJoypadButton):
		Players.connect_player(event.device)



#	if event.is_action_pressed("Exit"):
#		if event is InputEventKey:
#			Players.disconnect_player(event.device, true, "Keyboard")
#		elif event is InputEventJoypadButton: 
#			Players.disconnect_player(event.device, false, Input.get_joy_name(event.device))
#
#
#		Players.connect_player(event.device, true, "Keyboard")
#	elif event is InputEventJoypadButton: 

#	elif event is InputEventJoypadMotion:
#		pass
#	elif event is InputEventScreenTouch:
#		pass
#	elif event is InputEventMouse:
#		pass
#	else:
#		print("Input from Unknown Device ")


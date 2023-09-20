extends Node

var max_players = 6
var players: Array[Player] = []

func _ready():
	for i in range(max_players):
		players.append(Player.new())
	update_players()


func _process(delta):pass


func has_device(device_id):
	for i in range(players.size()):
		if players[i].connected && players[i].device_id == device_id:
			return true
	return false


func update_players():
	for i in range(players.size()):
		players[i].id = i
	get_tree().call_group("players_listeners", "on_players_updated")


func connect_player(device_id):
	if has_device(device_id):
		return
	for i in range(players.size()):
		if players[i].connected == false:
			players[i].connected = true
			players[i].keyboard = (device_id == Type.KEYBOARD)
			players[i].device_id = device_id
			players[i].device_name = "Keyboard" if players[i].keyboard else Input.get_joy_name(device_id)
			update_players()
			return


func disconnect_player(device_id):
	for i in range(players.size()):
		if players[i].connected == true:
			if players[i].device_id == device_id:
				players.erase(players[i])
				players.append(Player.new())
				update_players()

#Input.connect("joy_connection_changed", self, "_on_joy_connection_changed")
#func _on_joy_connection_changed(device_id, connected):
#	if connected:
#		print(Input.get_joy_name(device_id))
#	else:
#		print("Keyboard")


func _input(event):
	if event is InputEventKey:
		event.set_device(Type.KEYBOARD)
		print("handled by Players")

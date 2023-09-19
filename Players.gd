extends Node

var Player = {
	"name": "",
	"connected": false,
	"keyboard": false,
	"device_id": null,
	"device_name": ""
}
var players = []

# Called when the node enters the scene tree for the first time.
func _ready():
	#Input.connect("joy_connection_changed", self, "_on_joy_connection_changed")
	for i in range(6):
		var player_data = Player.duplicate()  # Create a copy of the Player structure
		player_data["name"] = "Player " + str(i + 1)  # Set player name
		players.append(player_data)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func has_device(device_id):
	for i in range(players.size()):
		if players[i].connected == true:
			if players[i].device_id == device_id:
				return true
	return false


func disconnect_player(device_id):
	for i in range(players.size()):
		if players[i].connected == true:
			if players[i].device_id == device_id:
				var player_data = Player.duplicate()  # Create a copy of the Player structure
				player_data["name"] = "Player " + str(i + 1)  # Set player name
				players[i] = player_data

func connect_player(device_id):
	if has_device(device_id):
		return
	
	for i in range(players.size()):
		if players[i].connected == false:
			players[i].connected = true
			players[i].keyboard = (device_id == Type.KEYBOARD)
			players[i].device_id = device_id
			players[i].device_name = "Keyboard" if players[i].keyboard else Input.get_joy_name(device_id)
			return



func _on_joy_connection_changed(device_id, connected):
	if connected:
		print(Input.get_joy_name(device_id))
	else:
		print("Keyboard")

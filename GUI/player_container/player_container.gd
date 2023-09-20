extends MarginContainer

var my_index : int
var my_player : Player

@onready var state_machine = $AnimationTree.get("parameters/playback")
@onready var tabContainer = $VBoxContainer/TabContainer
@onready var Term = $VBoxContainer/TabContainer/HBoxContainer/Term
@onready var Title = $VBoxContainer/TabContainer/HBoxContainer/Title


func _ready():pass

func _process(delta):
	var col = Type.colors[my_player.color_index]
	$Background.material.set_shader_parameter("coloration", col.h)
	pass


func set_index(index: int):
	my_index = index
	on_players_updated()


func on_players_updated():
	my_player = Players.players[my_index]
	$VBoxContainer/TabContainer/nickname.text = my_player.get_nick()
	$VBoxContainer/device.text = str(my_player.device_name)
	if state_machine:
		if my_player.connected:
			state_machine.travel("Active")
		else:
			state_machine.travel("RESET")


func _unhandled_input(event):
	if event.device != my_player.device_id:return
	if event.is_action_pressed("slider_left"):
		my_player.set_color(1)
	elif event.is_action_pressed("slider_right"):
		my_player.set_color(-1)
	elif event.is_action_pressed("up"):
		tabContainer.current_tab = 1
		if tabContainer.current_tab == 1:
			Title.text = Type.titles.pick_random()
	elif event.is_action_pressed("down"):
		tabContainer.current_tab = 1
		if tabContainer.current_tab == 1:
			Term.text = Type.terms.pick_random()

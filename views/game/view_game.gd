extends MarginContainer

var hscor = 0
var score = 0
var lives = 3
var round = 1


func _ready():
	reset_stage()

func _process(delta):
	get_tree().call_group("game_listeners", "update_stats", hscor, score, lives, round)
	pass


#Init the game world
func reset_stage():
	get_tree().call_group("overlays", "display_gameover", false)
	reset_movers()
	load_bricks()
	pass

#Reset all moving entities, removes the real ball, shows a placeholder ball stuck to the 
#player. Starts a timer that will remove the placeholder and spawn the real ball.
func reset_movers():
	$Movers/Ball.global_position = Vector2(2000,2000)
	$Movers/Slider.global_position = Vector2(400,900)
	$Movers/Slider/Fakeball.visible = true
	$Movers/start_timer.start()
	get_tree().call_group("overlays", "display_timer", $Movers/start_timer)
	pass

#Loads in the bricks for the current stage
func load_bricks():
	pass

#Called when the timer runs out
func _on_start_timer_timeout():	#waits x seconds before the ball starts moving
	enable_movers()

#Hides fake ball, spawns real ball
func enable_movers():
	$Movers/Slider/Fakeball.visible = false
	$Movers/Ball.global_position = $Movers/Slider/Fakeball.global_position


#Called when the ball detects a collision
func _on_ball_collided(body):
	##TODO play ping sound
	if body.get("Killer"):
		lose_life()
	if body.has_method("award_points"):
		score += body.award_points()


#Lose a life. If on the last life, gameover
func lose_life():
	print("lost life")
	if lives > 0:
		lives -=1
		reset_movers()
	else:
		gameover()

#Displays game over screen. Pauses the game.
func gameover():
	get_tree().paused = true
	get_tree().call_group("overlays", "display_gameover", true)
	pass

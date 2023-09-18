extends MarginContainer

func update_stats( hscor, score, lives, round):
	$VBoxContainer/hscor.text=str(hscor)
	$VBoxContainer/score.text=str(score)
	$VBoxContainer/lives.text=str(lives)
	$VBoxContainer/round.text=str(round)

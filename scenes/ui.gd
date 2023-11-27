extends CanvasLayer

@export var timer: Timer

func _process(_delta):
	if timer.time_left != 0:
		$InfoLabel.text = str(int(ceil(timer.time_left)))

func display_start_text():
	$InfoLabel.text = "Go!"
	$StartTextTimer.start()

func update_score(player: int, score: int):
	if (player == 1):
		$Player1ScoreLabel.text = str(score)
	else:
		$Player2ScoreLabel.text = str(score)

func display_game_over(winning_player: int):
	$InfoLabel.text = "Player %s wins!" % winning_player

func _on_start_text_timer_timeout():
	$InfoLabel.text = ""

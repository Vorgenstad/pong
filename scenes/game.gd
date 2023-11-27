extends Node2D

var player_1_score = 0
var player_2_score = 0

@export var winning_score: int

func _on_goal_area_entered(_area: Area2D, player_that_scored: int):
	$Ball.initialize()
	
	if player_that_scored == 1:
		player_1_score += 1
		$UI.update_score(1, player_1_score)
	else:
		player_2_score += 1
		$UI.update_score(2, player_2_score)
	
	if player_1_score == winning_score || player_2_score == winning_score:
		$UI.display_game_over(1 if player_1_score == winning_score else 2)
	else:
		$StartTimer.start()

func _on_start_timer_timeout():
	$Ball.start_moving()
	$UI.display_start_text()

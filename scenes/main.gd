extends Node2D

var player_1_score = 0
var player_2_score = 0

func _on_goal_area_entered(_area: Area2D, player_that_scored: int):
	$Ball.reset()

	if player_that_scored == 1:
		player_1_score += 1
	else:
		player_2_score += 1
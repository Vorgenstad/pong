extends Node2D

@export var winning_score: int

var player_1_score := 0
var player_2_score := 0

@onready var ball: Ball = $Ball
@onready var ui: Ui = $UI
@onready var start_timer: Timer = $StartTimer

func _on_goal_area_entered(_area: Area2D, player_that_scored: int) -> void:
	ball.initialize()
	
	if player_that_scored == 1:
		player_1_score += 1
		ui.update_score(1, player_1_score)
	else:
		player_2_score += 1
		ui.update_score(2, player_2_score)
	
	if player_1_score == winning_score || player_2_score == winning_score:
		ui.display_game_over(1 if player_1_score == winning_score else 2)
	else:
		start_timer.start()

func _on_start_timer_timeout() -> void:
	ball.start_moving()
	ui.display_start_text()

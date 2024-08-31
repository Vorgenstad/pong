extends Node2D

@export var winning_score: int

var scores := {
	Constants.Player.LEFT: 0,
	Constants.Player.RIGHT: 0,
}

@onready var ball: Ball = $Ball
@onready var ui: Ui = $UI
@onready var start_timer: Timer = $StartTimer

func _on_goal_area_entered(_area: Area2D, player_that_scored: Constants.Player) -> void:
	ball.initialize()
	
	var new_score: int = scores[player_that_scored] + 1

	scores[player_that_scored] = new_score

	ui.update_score(player_that_scored, new_score)

	if new_score == winning_score:
		ui.display_game_over(player_that_scored)
	else:
		start_timer.start()

func _on_start_timer_timeout() -> void:
	ball.start_moving()
	ui.display_start_text()

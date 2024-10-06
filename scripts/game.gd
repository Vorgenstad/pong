class_name Game
extends Node2D

signal quit_actioned

@onready var ball: Ball = $Ball
@onready var ui: Ui = $UI
@onready var start_timer: Timer = $StartTimer
@onready var goal_sound: AudioStreamPlayer = %GoalSound

var _winning_score: int

var _scores := {
	Constants.PlayerSide.LEFT: 0,
	Constants.PlayerSide.RIGHT: 0,
}

func initialize(winning_score: int, second_player_type: Constants.ControllerType) -> void:
	_winning_score = winning_score

	(%LeftPlayer as Palette).initialize(Constants.ControllerType.PLAYER)
	(%RightPlayer as Palette).initialize(second_player_type)

func _on_goal_area_entered(_area: Area2D, player_that_scored: Constants.PlayerSide) -> void:
	goal_sound.play()

	ball.initialize()
	
	var new_score: int = _scores[player_that_scored] + 1

	_scores[player_that_scored] = new_score

	ui.update_score(player_that_scored, new_score)

	if new_score == _winning_score:
		ui.display_game_over(player_that_scored)
	else:
		start_timer.start()

func _on_start_timer_timeout() -> void:
	ball.start_moving()
	ui.display_start_text()

func _on_restart_actioned() -> void:
	_scores[Constants.PlayerSide.LEFT] = 0
	_scores[Constants.PlayerSide.RIGHT] = 0

	ui.reset_score()

	ball.initialize()

	start_timer.start()

func _on_pause_menu_quit_actioned() -> void:
	quit_actioned.emit()

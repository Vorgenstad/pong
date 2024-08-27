class_name Ui
extends CanvasLayer

@export var timer: Timer

@onready var info_label: Label = $InfoLabel
@onready var start_text_timer: Timer = $StartTextTimer
@onready var player_1_score_label: Label = $Player1ScoreLabel
@onready var player_2_score_label: Label = $Player2ScoreLabel

func _process(_delta: float) -> void:
	if timer.time_left != 0:
		info_label.text = str(ceil(timer.time_left))

func display_start_text() -> void:
	info_label.text = "Go!"
	start_text_timer.start()

func update_score(player: int, score: int) -> void:
	if (player == 1):
		player_1_score_label.text = str(score)
	else:
		player_2_score_label.text = str(score)

func display_game_over(winning_player: int) -> void:
	info_label.text = "Player %s wins!" % winning_player

func _on_start_text_timer_timeout() -> void:
	info_label.text = ""

class_name Ui
extends CanvasLayer

signal restart_actioned

@export var timer: Timer

@onready var info_label: Label = $InfoLabel
@onready var start_text_timer: Timer = $StartTextTimer
@onready var left_score_label: Label = $LeftScoreLabel
@onready var right_score_label: Label = $RightScoreLabel
@onready var reset_button: Button = $ResetButton

func _process(_delta: float) -> void:
	if timer.time_left != 0:
		info_label.text = str(ceil(timer.time_left))

func display_start_text() -> void:
	info_label.text = "Go!"
	start_text_timer.start()

func update_score(player: Constants.Player, score: int) -> void:
	match player:
		Constants.Player.LEFT:
			left_score_label.text = str(score)
		Constants.Player.RIGHT:
			right_score_label.text = str(score)

func reset_score() -> void:
	left_score_label.text = "0"
	right_score_label.text = "0"
	
func display_game_over(winning_player: Constants.Player) -> void:
	info_label.text = "%s player wins!" % _format_player_name(winning_player)
	_activate_button()

func _format_player_name(player: Constants.Player) -> String:
	match player:
		Constants.Player.LEFT:
			return "Left"
		Constants.Player.RIGHT:
			return "Right"
		_:
			printerr("Unexpected player" + str(player))
			return ""

func _activate_button() -> void:
	# reset_button.disabled = false
	reset_button.visible = true

func _on_start_text_timer_timeout() -> void:
	info_label.text = ""

func _on_reset_button_pressed() -> void:
	reset_button.visible = false
	restart_actioned.emit()
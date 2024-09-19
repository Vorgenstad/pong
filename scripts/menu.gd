extends CanvasLayer

signal start_actioned(winning_score: int, second_player_type: Constants.ControllerType)

var _second_player_type: Constants.ControllerType

@onready var _play_button: Button = %PlayButton
@onready var _score_input_container: Container = %ScoreInputContainer
@onready var _player_input_container: Container = %PlayerInputContainer

func _on_play_button_pressed() -> void:
	_play_button.visible = false
	_player_input_container.visible = true

func _on_players_selected(second_player_type: Constants.ControllerType) -> void:
	_second_player_type = second_player_type

	_player_input_container.visible = false
	_score_input_container.visible = true

func _on_winning_score_selected(winning_score: int) -> void:
	start_actioned.emit(winning_score, _second_player_type)

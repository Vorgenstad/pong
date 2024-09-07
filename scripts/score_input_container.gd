extends HBoxContainer

signal winning_score_selected(winning_score: int)

@onready var _score_input: NumberInput = $ScoreInput

func _ready() -> void:
	_score_input.initialize(1, 10, 3)

func _on_accept_button_pressed() -> void:
	winning_score_selected.emit(_score_input.value)

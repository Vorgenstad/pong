extends CanvasLayer

signal start_actioned(winning_score: int)

@onready var play_button: Button = $PlayButton
@onready var _score_input_container: Container = $ScoreInputContainer

func _on_play_button_pressed() -> void:
	play_button.visible = false
	_score_input_container.visible = true

func _on_winning_score_selected(winning_score: int) -> void:
	start_actioned.emit(winning_score)

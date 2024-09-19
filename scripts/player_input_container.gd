extends VBoxContainer

signal players_selected(second_player_type: Constants.ControllerType)

func _on_player_button_pressed() -> void:
	players_selected.emit(Constants.ControllerType.PLAYER)

func _on_ai_button_pressed() -> void:
	players_selected.emit(Constants.ControllerType.AI)

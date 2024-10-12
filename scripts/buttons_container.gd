extends VBoxContainer

signal reset_actioned
signal quit_actioned

func _on_quit_button_pressed() -> void:
	quit_actioned.emit()

func _on_reset_button_pressed() -> void:
	reset_actioned.emit()

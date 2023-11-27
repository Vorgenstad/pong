extends CanvasLayer

signal start_actioned

func _on_play_button_pressed():
    start_actioned.emit()

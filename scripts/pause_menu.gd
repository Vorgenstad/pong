extends CanvasLayer

signal quit_actioned

@onready var _menu_elements: CanvasLayer = %MenuElements
@onready var _tree := get_tree()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		_toggle_pause()

func _toggle_pause() -> void:
	_tree.paused = !_tree.paused
	_menu_elements.visible = !_menu_elements.visible

func _on_resume_button_pressed() -> void:
	_toggle_pause()

func _on_quit_button_pressed() -> void:
	_toggle_pause()
	quit_actioned.emit()

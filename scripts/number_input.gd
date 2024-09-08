class_name NumberInput
extends Control

@onready var label: Label = $ValueLabel

var _initialized := false
var _max_value: int
var _min_value: int
var value: int

func initialize(min_value: int, max_value: int, default_value := 0) -> void:
	_min_value = min_value
	_max_value = max_value

	_update_value(default_value)

	_initialized = true

func _update_value(new_value: int) -> void:
	value = new_value
	label.text = str(value)

func _on_add_button_pressed() -> void:
	if not _initialized:
		printerr("Number input has not been initialized")
		return

	if value == _max_value:
		return

	_update_value(value + 1)

func _on_subtract_button_pressed() -> void:
	if not _initialized:
		printerr("Number input has not been initialized")
		return

	if value == _min_value:
		return

	_update_value(value - 1)

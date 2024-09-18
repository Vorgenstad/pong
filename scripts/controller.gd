class_name Controller
extends Node

var palette: Palette

const _speed = 300

var _upper_limit: float
var _lower_limit: float

func _set_movement_limits() -> void:
	var height := palette.texture.get_height()
	_upper_limit = 0 + height / 2.0

	var screen_height := get_viewport().get_visible_rect().size.y

	_lower_limit = screen_height - height / 2.0

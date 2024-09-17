class_name AIController
extends Node

@export var palette: Palette

const _speed = 300

var _upper_limit: float
var _lower_limit: float

@onready var _ball: Ball = get_node("../%Ball")

func _ready() -> void:
	_set_movement_limits()

func _process(delta: float) -> void:
	var direction := 0
	
	if _ball.position.y < palette.position.y:
		direction = -1
	if _ball.position.y > palette.position.y:
		direction = 1
	
	if direction != 0:
		palette.position.y += _speed * direction * delta
	
	palette.position.y = clamp(palette.position.y, _upper_limit, _lower_limit)

func _set_movement_limits() -> void:
	var height := palette.texture.get_height()
	_upper_limit = 0 + height / 2.0

	var screen_height := get_viewport().get_visible_rect().size.y

	_lower_limit = screen_height - height / 2.0

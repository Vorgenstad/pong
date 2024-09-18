class_name PlayerController
extends Controller

var _up_action: String
var _down_action: String

func _ready() -> void:
	_set_movement_limits()
	_set_actions()

func _process(delta: float) -> void:
	var direction := 0
	
	if Input.is_action_pressed(_up_action):
		direction = -1
	if Input.is_action_pressed(_down_action):
		direction = 1
	
	if direction != 0:
		palette.position.y += _speed * direction * delta
	
	palette.position.y = clamp(palette.position.y, _upper_limit, _lower_limit)

func _set_movement_limits() -> void:
	var height := palette.texture.get_height()
	_upper_limit = 0 + height / 2.0

	var screen_height := get_viewport().get_visible_rect().size.y

	_lower_limit = screen_height - height / 2.0

func _set_actions() -> void:
	match palette.player_side:
		Constants.PlayerSide.LEFT:
			_up_action = "left_player_up"
			_down_action = "left_player_down"
		Constants.PlayerSide.RIGHT:
			_up_action = "right_player_up"
			_down_action = "right_player_down"

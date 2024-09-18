class_name AIController
extends Controller

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

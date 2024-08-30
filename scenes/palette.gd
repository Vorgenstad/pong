extends Area2D

@export var up_key: Key
@export var down_key: Key

const speed = 300

var upper_limit: float
var lower_limit: float

func _ready() -> void:
	var height := ($Sprite2D as Sprite2D).texture.get_height()
	upper_limit = 0 + height / 2.0

	var screen_height := get_viewport().get_visible_rect().size.y

	lower_limit = screen_height - height / 2.0

func _process(delta: float) -> void:
	var direction := 0
	
	if Input.is_key_pressed(up_key):
		direction = -1
	if Input.is_key_pressed(down_key):
		direction = 1
	
	if direction != 0:
		position.y += speed * direction * delta
	
	position.y = clamp(position.y, upper_limit, lower_limit)

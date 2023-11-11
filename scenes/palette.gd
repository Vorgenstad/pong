extends Area2D

@export var up_key: Key
@export var down_key: Key

const speed = 300
const screen_height = 720

var upper_limit
var lower_limit

func _ready():
	var height = $Sprite2D.texture.get_height()
	upper_limit = 0 + height / 2
	lower_limit = screen_height - height / 2

func _process(delta):
	var direction = 0
	
	if Input.is_key_pressed(up_key):
		direction = -1
	if Input.is_key_pressed(down_key):
		direction = 1
	
	if direction != 0:
		position.y += speed * direction * delta
	
	position.y = clamp(position.y, upper_limit, lower_limit)


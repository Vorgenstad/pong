extends Node2D

const player_speed = 300
var upper_limit
var lower_limit

func _ready():
	var screen_height = get_viewport_rect().size.y
	var player_height = $Player1.texture.get_height()
	
	upper_limit = 0 + player_height / 2
	lower_limit = screen_height - player_height / 2

func _process(delta):
	process_player_movement($Player1, KEY_W, KEY_S, delta)
	process_player_movement($Player2, KEY_UP, KEY_DOWN, delta)

func process_player_movement(player, up_key, down_key, delta):
	var direction = 0
	
	if Input.is_key_pressed(up_key):
		direction = -1
	if Input.is_key_pressed(down_key):
		direction = 1
	
	if direction != 0:
		player.position.y += player_speed * direction * delta
	
	player.position.y = clamp(player.position.y, upper_limit, lower_limit)

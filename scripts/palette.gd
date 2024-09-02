extends Area2D

@export var player: Constants.Player

const speed = 300

var up_action: String
var down_action: String

var upper_limit: float
var lower_limit: float

func _ready() -> void:
	set_movement_limits()
	set_actions()

func _process(delta: float) -> void:
	var direction := 0
	
	if Input.is_action_pressed(up_action):
		direction = -1
	if Input.is_action_pressed(down_action):
		direction = 1
	
	if direction != 0:
		position.y += speed * direction * delta
	
	position.y = clamp(position.y, upper_limit, lower_limit)

func set_movement_limits() -> void:
	var height := ($Sprite2D as Sprite2D).texture.get_height()
	upper_limit = 0 + height / 2.0

	var screen_height := get_viewport().get_visible_rect().size.y

	lower_limit = screen_height - height / 2.0

func set_actions() -> void:
	match player:
		Constants.Player.LEFT:
			up_action = "left_player_up"
			down_action = "left_player_down"
		Constants.Player.RIGHT:
			up_action = "right_player_up"
			down_action = "right_player_down"

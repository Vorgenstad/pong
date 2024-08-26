extends Area2D

@export var speed = 400

var x_direction
var y_direction
var moving = false

const initial_position = Vector2(640, 360)

func _ready():
	initialize()

func _process(delta):
	if moving:
		var velocity = Vector2(x_direction, y_direction).normalized() * speed
		position += velocity * delta

func pick_random_option(a, b):
	return a if randi_range(0, 1) % 2 else b

func initialize():
	x_direction = pick_random_option(2, -2)
	y_direction = pick_random_option(1, -1)
	position = initial_position
	moving = false

func start_moving():
	moving = true

func _on_area_entered(area):
	if area.get_collision_layer() == 1:
		x_direction = -x_direction
	else:
		y_direction = -y_direction

extends Area2D

@export var speed = 400

var x_direction
var y_direction

func _ready():
	x_direction = pick_random_option(2 , -2)
	y_direction = pick_random_option(1 , -1)

func _process(delta):	
	var velocity = Vector2(x_direction, y_direction).normalized() * speed

	position += velocity * delta

func pick_random_option(a, b):
	return a if randi() % 2 else b

func _on_area_entered(area):
	if area.get_collision_layer() == 1:
		x_direction = -x_direction
	else:
		y_direction = -y_direction

class_name Ball
extends Area2D

@export var initial_speed: float = 400

var speed: float
var x_direction: int
var y_direction: int
var moving := false
var initial_position: Vector2

func _ready() -> void:
	var screen_size := get_viewport().get_visible_rect().size
	initial_position = screen_size / 2

	initialize()

func _process(delta: float) -> void:
	if moving:
		var velocity := Vector2(x_direction, y_direction).normalized() * speed
		position += velocity * delta

func initialize() -> void:
	speed = initial_speed
	x_direction = _pick_random_option(2, -2)
	y_direction = _pick_random_option(1, -1)
	position = initial_position
	moving = false

func start_moving() -> void:
	moving = true

func _pick_random_option(a: int, b: int) -> int:
	return a if randi_range(0, 1) % 2 else b

func _on_area_entered(area: Area2D) -> void:
	if area.get_collision_layer() == 1:
		x_direction = -x_direction
	else:
		y_direction = -y_direction

func _on_acceleration_timer_timeout() -> void:
	if moving:
		speed += 10

	print(speed)
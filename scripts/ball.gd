class_name Ball
extends Area2D

@export var initial_speed: float = 500

@onready var pallete_hit_sound: AudioStreamPlayer = %PaletteHitSound
@onready var wall_hit_sound: AudioStreamPlayer = %WallHitSound

var speed: float
var direction: Vector2
var moving := false
var initial_position: Vector2

func _ready() -> void:
	var screen_size := get_viewport().get_visible_rect().size
	initial_position = screen_size / 2

	initialize()

func _process(delta: float) -> void:
	if moving:
		var velocity := direction.normalized() * speed
		position += velocity * delta

func initialize() -> void:
	speed = initial_speed
	direction = Vector2(_pick_random_option(2, -2), _pick_random_option(1, -1))
	position = initial_position
	moving = false

func start_moving() -> void:
	moving = true

func hit(hit_direction: Constants.HitDirection) -> void:
	pallete_hit_sound.play()

	direction.x = -direction.x
	
	match hit_direction:
		Constants.HitDirection.UP:
			direction.y = -1
		Constants.HitDirection.DOWN:
			direction.y = 1

func _pick_random_option(a: int, b: int) -> int:
	return a if randi_range(0, 1) % 2 else b

func _on_area_entered(_area: Area2D) -> void:
	wall_hit_sound.play()

	direction.y = -direction.y

func _on_acceleration_timer_timeout() -> void:
	if moving:
		speed += 20

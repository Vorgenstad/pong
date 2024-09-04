extends Sprite2D

@export var player: Constants.Player

@onready var upper_collision_shape: CollisionShape2D = $UpperArea/CollisionShape
@onready var lower_collision_shape: CollisionShape2D = $LowerArea/CollisionShape
@onready var hit_cooldown_timer: Timer = $HitCooldownTimer

const speed = 300

var up_action: String
var down_action: String

var upper_limit: float
var lower_limit: float

var collided := false

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
	var height := texture.get_height()
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

func disable_collisions_temporarily() -> void:
	upper_collision_shape.set_deferred("disabled", true)
	lower_collision_shape.set_deferred("disabled", true)

	hit_cooldown_timer.start()

func _on_upper_area_entered(area: Area2D) -> void:
	if collided:
		return ;
	
	collided = true

	disable_collisions_temporarily()

	var ball := area as Ball
	ball.hit(Constants.HitDirection.UP)

func _on_lower_area_entered(area: Area2D) -> void:
	if collided:
		return ;
	
	collided = true

	disable_collisions_temporarily()

	var ball := area as Ball
	ball.hit(Constants.HitDirection.DOWN)

func _on_hit_cooldown_timer_timeout() -> void:
	collided = false
	upper_collision_shape.set_deferred("disabled", false)
	lower_collision_shape.set_deferred("disabled", false)

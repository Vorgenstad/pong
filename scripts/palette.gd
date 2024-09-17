class_name Palette
extends Sprite2D

@export var player: Constants.Player

@onready var upper_collision_shape: CollisionShape2D = $UpperArea/CollisionShape
@onready var lower_collision_shape: CollisionShape2D = $LowerArea/CollisionShape
@onready var hit_cooldown_timer: Timer = $HitCooldownTimer

var collided := false

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

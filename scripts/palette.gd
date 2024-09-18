class_name Palette
extends Sprite2D

@export var player_side: Constants.PlayerSide
@export var player_controller_scene: PackedScene
@export var ai_controller_scene: PackedScene

@onready var upper_collision_shape: CollisionShape2D = $UpperArea/CollisionShape
@onready var lower_collision_shape: CollisionShape2D = $LowerArea/CollisionShape
@onready var hit_cooldown_timer: Timer = $HitCooldownTimer

var _collided := false

func initialize(controller: Constants.ControllerType) -> void:
	match controller:
		Constants.ControllerType.PLAYER:
			_add_controller(player_controller_scene)
		Constants.ControllerType.AI:
			_add_controller(ai_controller_scene)

func disable_collisions_temporarily() -> void:
	upper_collision_shape.set_deferred("disabled", true)
	lower_collision_shape.set_deferred("disabled", true)

	hit_cooldown_timer.start()

func _add_controller(controller_scene: PackedScene) -> void:
	var controller: Controller = controller_scene.instantiate()
	
	controller.palette = self

	add_child(controller)

func _on_upper_area_entered(area: Area2D) -> void:
	if _collided:
		return ;
	
	_collided = true

	disable_collisions_temporarily()

	var ball := area as Ball
	ball.hit(Constants.HitDirection.UP)

func _on_lower_area_entered(area: Area2D) -> void:
	if _collided:
		return ;
	
	_collided = true

	disable_collisions_temporarily()

	var ball := area as Ball
	ball.hit(Constants.HitDirection.DOWN)

func _on_hit_cooldown_timer_timeout() -> void:
	_collided = false
	upper_collision_shape.set_deferred("disabled", false)
	lower_collision_shape.set_deferred("disabled", false)

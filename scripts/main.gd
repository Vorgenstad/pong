extends Node

@export var gameScene: PackedScene

func _on_menu_start_actioned(winning_score: int, second_player_type: Constants.ControllerType) -> void:
	var game: Game = gameScene.instantiate()

	game.initialize(winning_score, second_player_type)

	add_child(game)

	$Menu.queue_free()

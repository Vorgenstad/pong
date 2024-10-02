extends Node

@export var gameScene: PackedScene

func _on_menu_start_actioned(winning_score: int, second_player_type: Constants.ControllerType) -> void:
	var game: Game = gameScene.instantiate()

	game.quit_actioned.connect(_on_game_quit_actioned)

	game.initialize(winning_score, second_player_type)

	add_child(game)

	$Menu.queue_free()

func _on_game_quit_actioned() -> void:
	get_tree().reload_current_scene()
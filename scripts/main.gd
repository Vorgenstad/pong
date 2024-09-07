extends Node

@export var gameScene: PackedScene

func _on_menu_start_actioned(winning_score: int) -> void:
	var game: Game = gameScene.instantiate()

	game.winning_score = winning_score

	add_child(game)

	$Menu.queue_free()

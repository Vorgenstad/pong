extends Node

@export var gameScene: PackedScene

func _on_menu_start_actioned() -> void:
	add_child(gameScene.instantiate())
	$Menu.queue_free()

extends Node2D

func _on_character_scene_end() -> void:
	get_tree().change_scene_to_file("res://scenes/desktop.tscn")

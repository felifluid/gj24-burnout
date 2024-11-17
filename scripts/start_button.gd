extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _on_pressed() -> void:
	print("1")
	get_tree().change_scene_to_file("res://scenes/desktop.tscn")
	print("2")

extends Area2D
var entered = false

signal endOfScreen

func _on_body_entered(CharacterBody2D):
	entered = true
	
	
func _physics_process (_delta):
	if entered == true:
		endOfScreen.emit()

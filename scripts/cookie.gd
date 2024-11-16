extends Button

func _on_pressed() -> void:
	queue_free()

func _on_timer_timeout() -> void:
	queue_free()

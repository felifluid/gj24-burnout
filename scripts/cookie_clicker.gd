class_name CookieClicker
extends Control

@export var label : Label
var cookie = preload("res://assets/cookie.tscn")

var points : int = 0

@onready var range_min : Vector2 = Vector2(0,0) + Vector2(10,10)
@onready var range_max : Vector2 = size - Vector2(90, 90)

func increase_points(value : int) -> void:
	points += value
	label.text = "Punkte: " + str(points)

func spawn_cookie() -> void:
	var cookie_instance = cookie.instantiate()
	add_child(cookie_instance)
	cookie_instance.set_position(Vector2(randf_range(range_min.x, range_max.x), randf_range(range_min.y, range_max.y)))
	cookie_instance.connect("buttonDone", self._on_button_done)
					
func _on_button_done(value : int) -> void:
	increase_points(value)

func _on_timer_timeout() -> void:
	spawn_cookie()

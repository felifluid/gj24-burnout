class_name CookieClicker
extends Control

@export var label : Label
var cookie = preload("res://assets/cookie.tscn")

var points : int = 0

@onready var range_min : Vector2 = Vector2(0,0) + Vector2(10,10)
@onready var range_max : Vector2 = size - Vector2(90, 90)

func increase_points() -> void:
	points += 1
	
func update_label_text() -> void:
	label.text = "Punkte: " + str(points)

func spawn_cookie() -> void:
	var cookie_instance = cookie.instantiate()
	add_child(cookie_instance)
	cookie_instance.connect("pressed", self._on_button_pressed)
	cookie_instance.set_position(Vector2(randf_range(range_min.x, range_max.x), randf_range(range_min.y, range_max.y)))
	
					
func _on_button_pressed() -> void:
	increase_points()
	update_label_text()


func _on_timer_timeout() -> void:
	spawn_cookie()

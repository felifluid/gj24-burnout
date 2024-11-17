class_name CookieClicker
extends Control

@export var label : Label
@export var labelCombo : Label
@export var comboDeclineCD : Timer
@export var comboDecline : Timer

var cookie = preload("res://assets/cookie.tscn")

var points : int = 0
var combo : int = 1

@onready var range_min : Vector2 = Vector2(0,0) + Vector2(10,10)
@onready var range_max : Vector2 = size - Vector2(90, 90)

func _ready() -> void:
	update_combo_label()

func increase_points(value : int) -> void:
	points += value * combo
	label.text = "Punkte: " + str(points)

func spawn_cookie() -> void:
	var cookie_instance = cookie.instantiate()
	add_child(cookie_instance)
	cookie_instance.set_position(Vector2(randf_range(range_min.x, range_max.x), randf_range(range_min.y, range_max.y)))
	cookie_instance.connect("buttonDone", self._on_button_done)
					
func _on_button_done(value : int) -> void:
	increase_points(value)
	increase_combo()
	comboDecline.paused = true
	comboDeclineCD.start() # reset timer

func increase_combo() -> void:
	combo = combo * 2
	update_combo_label()

func decrease_combo() -> void:
	if (combo > 1):
		combo = combo / 2
		update_combo_label()

func update_combo_label() -> void:
	labelCombo.text = "COMBO x" + str(combo)

func _on_timer_timeout() -> void:
	spawn_cookie()

func _on_combo_decline_timeout() -> void:
	decrease_combo()

func _on_combo_decline_cooldown_timeout() -> void:
	comboDecline.paused = false

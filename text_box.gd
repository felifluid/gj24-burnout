extends CanvasLayer

const CHAR_READ_RATE = 0.2

@export var text : String

@onready var label : Label = get_node("MarginContainer/MarginContainer/HBoxContainer/Text")

@onready var tween : Tween = create_tween()

func _ready() -> void:
	pass
	
func add_text(next_text) -> void :
	label.text = next_text
	tween.tween_property(label,"visible_ratio", 1, len(next_text)*CHAR_READ_RATE)

extends Container

const CHAR_READ_RATE = 0.05

@export_multiline var text : String

var text_queue : Array

@onready var label : Label = get_node("MarginContainer/MarginContainer/HBoxContainer/Text")
@onready var end : Label = get_node("MarginContainer/MarginContainer/HBoxContainer/End")

var tween : Tween

var textFinished : bool = false

enum State {
	READY,
	READING,
	FINISHED
}

var current_state

signal textDone

func _ready() -> void:
	text_queue = Array(text.split('\n'))
	tween = get_tree().create_tween()
	tween.connect("finished", _on_tween_finished)
	change_state(State.READY)

func _process(delta: float) -> void:
	var mouse_pressed = Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)
	var skip_demanded = Input.is_action_just_pressed("ui_accept", true) || mouse_pressed
	match current_state:
		State.READY:
			pass
		State.READING:
			if (skip_demanded) :
				change_state(State.FINISHED)
		State.FINISHED:
			
			if (skip_demanded) :
				change_state(State.READY)

func display_text() -> void :
	show_textbox()
	var next_text : String = str(text_queue.pop_front()).rstrip(' ')
	print("text: " + next_text)
	change_state(State.READING)
	label.text = next_text
	label.visible_ratio = 0
	tween.tween_property(label,"visible_ratio", 1, len(next_text)*CHAR_READ_RATE)
	tween.play()
	
func _on_tween_finished():
	change_state(State.FINISHED)

func show_textbox() -> void:
	self.show()

func hide_textbox() -> void:
	label.text = ""
	textDone.emit()
	#get_tree().change_scene_to_file("res://scenes/desktop.tscn")

func change_state(next_state):
	current_state = next_state
	match current_state:
		State.READY:
			end.visible_ratio = 0
			if (text_queue.size() > 0):
				display_text()
			else :
				textFinished = true
				hide_textbox()
		State.READING:
			pass
		State.FINISHED:
			tween.stop()
			label.visible_ratio = 1
			end.visible_ratio = 1

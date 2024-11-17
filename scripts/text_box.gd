extends Container

const CHAR_READ_RATE = 0.05

@export var text : String

var text_queue : Array

@onready var label : Label = get_node("MarginContainer/MarginContainer/HBoxContainer/Text")
@onready var end : Label = get_node("MarginContainer/MarginContainer/HBoxContainer/End")

var tween : Tween

enum State {
	READY,
	READING,
	FINISHED
}

var current_state

func activate() -> void:
	text_queue = Array(text.split('\n'))
	tween = get_tree().create_tween()
	tween.connect("finished", _on_tween_finished)
	change_state(State.READY)

func _process(delta: float) -> void:
	match current_state:
		State.READY:
			pass
		State.READING:
			if (Input.is_action_just_pressed("ui_accept", true)) :
				change_state(State.FINISHED)
		State.FINISHED:
			if Input.is_action_just_pressed("ui_accept", true) :
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
	self.hide()

func change_state(next_state):
	current_state = next_state
	match current_state:
		State.READY:
			end.visible_ratio = 0
			if (text_queue.size() > 0):
				display_text()
			else :
				hide_textbox()
		State.READING:
			pass
		State.FINISHED:
			tween.stop()
			label.visible_ratio = 1
			end.visible_ratio = 1

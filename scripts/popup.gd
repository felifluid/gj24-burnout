extends Window

@export var showtime : float
@export_multiline var textboxText : String

@onready var textbox = get_node("background/MarginContainer/RowsContainer/TextBox")

var hasActivated : bool = false

signal buttonPressed

# Called when the node enters the scene tree for the first time.
func _init():
	self.hide()

func _ready() -> void:
	textbox.text = textboxText
	
func appear():
	textbox.activate()
	self.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_control_clock_changed(time: float) -> void:
	if (!hasActivated):
		if (time >= showtime) :
			appear()
			hasActivated = true

extends Window

@export var showtime : float
@export_multiline var textboxText : String
@export_file var scene
@export var buttonText : String
@export_file var imagePath

@onready var button : Button = get_node("background/MarginContainer/RowsContainer/Button")
@onready var textbox = get_node("background/MarginContainer/RowsContainer/TextBox")
@onready var sprite = get_node("background/MarginContainer/RowsContainer/gameInfo/TextureRect")

var hasActivated : bool = false

signal buttonPressed

# Called when the node enters the scene tree for the first time.
func _init():
	self.hide()

func _ready() -> void:
	textbox.text = textboxText
	button.text = buttonText
	var image = Image.load_from_file(imagePath)
	sprite.texture = ImageTexture.create_from_image(image)
	
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

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file(scene)

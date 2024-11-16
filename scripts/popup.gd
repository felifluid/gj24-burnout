extends Window

@onready var popup: Window = get_node(".")
@export var pause: float = 5.0

# Called when the node enters the scene tree for the first time.
func _init():
	self.hide()

func _ready():
	appear()
	
func appear():
	get_tree().create_timer(10.0).timeout
	self.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

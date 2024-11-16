extends Window

@export var showtime : float

# Called when the node enters the scene tree for the first time.
func _init():
	self.hide()
	
func appear():
	#get_tree().create_timer(10.0).timeout
	self.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_control_clock_changed(time: float) -> void:
	if (time >= showtime) :
		appear()

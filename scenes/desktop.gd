extends Control

@onready var dayTimer : Timer = get_node("DayTimer")
@onready var clock : Label = get_node("Clock")

@export var dayHours : int
@export var workshift : int

signal clock_changed(time : float)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	updateClock()
	pass


func getTime() -> float:
	var ellapsed_time : float  = dayTimer.wait_time - dayTimer.time_left
	return (ellapsed_time / dayTimer.wait_time) * dayHours + workshift # 10 hour work day, starting at 8 am

func updateClock() -> void:
	var time : float = getTime()
	var hours : int = floor(time)
	var minutes : int = (time - hours) * 60
	var zero = ""
	if (minutes < 10):
		zero = "0"
	clock.text = str(hours) + ":" + str(zero) + str(minutes)
	if (dayTimer.wait_time - dayTimer.time_left > dayTimer.wait_time / dayHours * workshift):
		clock.add_theme_color_override("font_color", Color.RED)
	clock_changed.emit(time)

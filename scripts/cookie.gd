extends Button

var hitpoints : int
const HITPOINT_OPTIONS = [1,2,3,4,6,12]

var timer : Timer
var sprite : AnimatedSprite2D
	
func _ready() -> void:
	var index : int = randi_range(0, HITPOINT_OPTIONS.size() - 1)
	hitpoints = HITPOINT_OPTIONS[index]
	sprite = get_node("AnimatedSprite2D")
	sprite.animation = str(hitpoints)
	timer = get_node("Timer")

func _on_pressed() -> void:
	if (hitpoints > 0) :
		hitpoints -= 1
		sprite.frame += 1
		timer.stop()
		timer.start()
	else :
		queue_free()

func _on_timer_timeout() -> void:
	queue_free()

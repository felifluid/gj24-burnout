extends Button

var hitpoints : int
const HITPOINT_OPTIONS = [1,2,3,4,6,12]
var current_hitpoints : int
@export var fadeDuration = 1

var timer : Timer
var sprite : AnimatedSprite2D

signal buttonDone(value : int)
	
func _ready() -> void:
	var index : int = randi_range(0, HITPOINT_OPTIONS.size() - 1)
	hitpoints = HITPOINT_OPTIONS[index]
	current_hitpoints = hitpoints
	sprite = get_node("AnimatedSprite2D")
	sprite.animation = str(hitpoints)
	timer = get_node("Timer")

func _on_pressed() -> void:
	if (current_hitpoints > 1) :
		current_hitpoints -= 1
		sprite.frame += 1
		timer.stop()
		timer.start()
	else :
		buttonDone.emit(hitpoints)
		var tween = get_tree().create_tween()
		tween.tween_property(sprite, "modulate", Color(0,0,0,0), 0.2).set_ease(0).set_trans(1)
		
		await tween.finished
		queue_free()
		#print("queue_free() happened")
		
func _fade(sprite):
	var tween = get_tree().create_tween()
	tween.interpolate_property(sprite, "modulate: a", 
	sprite.modulate.a, 0.0, 0.25, tween.TRANS_SINE, tween.EASE_OUT)


func _on_timer_timeout() -> void:
	queue_free()

extends CharacterBody2D
@onready var _animated_sprite = $AnimatedSprite2D
@onready var textbox = get_node("TextBox")

var velocityX = 40.0
signal sceneEnd
var textDone : bool = false


func _physics_process(delta: float) -> void:
	self.velocity.x = velocityX
	move_and_slide()
	if (velocity.x > 0):
		_animated_sprite.play("default")

func _on_area_2d_end_of_screen() -> void:
	if (textDone):
		sceneEnd.emit()	
	else:
		velocityX = 0

func _on_text_box_text_done() -> void:
	if (velocityX == 0):
		sceneEnd.emit()
	else :
		textDone = true

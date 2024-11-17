extends CharacterBody2D
@onready var _animated_sprite = $AnimatedSprite2D
@onready var textbox = get_node("TextBox")

var velocityX = 40.0

func _physics_process(delta: float) -> void:
	self.velocity.x = velocityX
	move_and_slide()
	if (velocity.x > 0):
		_animated_sprite.play("default")

func _on_area_2d_end_of_screen() -> void:
	velocityX = 0

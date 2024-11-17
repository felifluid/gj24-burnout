extends CharacterBody2D
@onready var _animated_sprite = $AnimatedSprite2D

const VELOCITY = 30.0

func _physics_process(delta: float) -> void:
	self.velocity.x = VELOCITY
	move_and_slide()
	_animated_sprite.play("default")
#
#func _physics_process(delta):
	## Add the gravity.				
	##if not is_on_floor():
		##velocity += get_gravity() * delta
#
	## Handle jump.
	##if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	##	velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()
	#if Input.is_action_pressed("ui_right"):
		#_animated_sprite.play("default")
	#else:
		#_animated_sprite.stop()

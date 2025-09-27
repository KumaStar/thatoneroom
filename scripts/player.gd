extends CharacterBody2D

@export var speed: float = 250.0
@onready var anim_sprite: AnimatedSprite2D = $body  # make sure the node path is correct
@onready var face: AnimatedSprite2D = $face

func _physics_process(delta: float) -> void:
	var input_vector := Vector2.ZERO

	# Horizontal
	if Input.is_action_pressed("left"):
		input_vector.x -= 1
	elif Input.is_action_pressed("right"):
		input_vector.x += 1

	# Vertical
	elif Input.is_action_pressed("up"):
		input_vector.y -= 1
	elif Input.is_action_pressed("down"):
		input_vector.y += 1

	# Move the player
	velocity = input_vector * speed
	move_and_slide()

	# Handle animations
	if input_vector.x < 0:
		if anim_sprite.animation != "left":
			anim_sprite.play("left")
			face.play("left")
			
	elif input_vector.x > 0:
		if anim_sprite.animation != "right":
			anim_sprite.play("right")
			face.play("right")
			
	elif input_vector.y < 0:
		if anim_sprite.animation != "up":
			anim_sprite.play("up")
			face.play("up")
	elif input_vector.y > 0:
		if anim_sprite.animation != "down":
			anim_sprite.play("down")
			face.play("down")

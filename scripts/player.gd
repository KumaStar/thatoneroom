extends CharacterBody2D

@export var speed: float = 250.0

func _physics_process(delta: float) -> void:
	var input_vector := Vector2.ZERO

	if Input.is_action_pressed("left"):
		input_vector.x -= 1
	elif Input.is_action_pressed("right"):
		input_vector.x += 1
		
	if Input.is_action_pressed("up"):
		input_vector.y -= 1
	elif Input.is_action_pressed("down"):
		input_vector.y += 1
		

	velocity = input_vector * speed
	move_and_slide()


func _on_areao_body_entered(body: Node2D) -> void:
	pass # Replace with function body.

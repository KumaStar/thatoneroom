extends CharacterBody2D

@onready var point_light_2d: PointLight2D = $PointLight2D
@export var speed: float = 200.0
@onready var anim_sprite: AnimatedSprite2D = $body
@onready var face: AnimatedSprite2D = $face

var last_direction: String = "down"
var moving: bool = false

func _process(delta: float) -> void:

	if Input.is_action_just_pressed("flash"):
		point_light_2d.visible = not point_light_2d.visible

func _physics_process(delta: float) -> void:
	var input_vector := Vector2.ZERO

	# --- Input handling (no diagonals) ---
	if Input.is_action_pressed("left"):
		input_vector = Vector2.LEFT
		last_direction = "left"
	elif Input.is_action_pressed("right"):
		input_vector = Vector2.RIGHT
		last_direction = "right"
	elif Input.is_action_pressed("up"):
		input_vector = Vector2.UP
		last_direction = "up"
	elif Input.is_action_pressed("down"):
		input_vector = Vector2.DOWN
		last_direction = "down"

	# --- Movement ---
	velocity = input_vector * speed
	move_and_slide()

	# --- Animation state logic ---
	if input_vector != Vector2.ZERO:
		if not moving:
			moving = true
			_play_move_anim()
		else:
			if anim_sprite.animation != last_direction:
				_play_move_anim()
	else:
		if moving:
			moving = false
			call_deferred("_set_idle_state")  # ensures correct frame sync


func _play_move_anim() -> void:
	anim_sprite.play(last_direction)
	face.play(last_direction)


func _set_idle_state() -> void:
	var idle_anim = "idle_" + last_direction

	if anim_sprite.sprite_frames.has_animation(idle_anim):
		# Use separate idle animation if available
		anim_sprite.play(idle_anim)
		face.play(idle_anim)
	else:
		# Otherwise freeze the first frame of the last walking animation
		anim_sprite.animation = last_direction
		anim_sprite.frame = 0
		anim_sprite.stop()

		face.animation = last_direction
		face.frame = 0
		face.stop()

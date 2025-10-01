extends StaticBody2D

@onready var interactable: Area2D = $interactable
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
	collision_shape_2d.disabled = true
	if animated_sprite_2d.animation == "closed":
		animated_sprite_2d.play("open")
		interactable.is_interactable = false
		

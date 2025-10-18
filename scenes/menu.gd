extends Control
var button_type = null



func _on_play_pressed() -> void:
	button_type = "play"
	$screen_transition.show()
	$screen_transition/fade_timer.start()
	$screen_transition/AnimationPlayer.play("fade_in")
	


func _on_fade_timer_timeout() -> void:
	if button_type == "play":
		get_tree().change_scene_to_file("res://scenes/game.tscn")

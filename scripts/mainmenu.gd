extends VBoxContainer

func _ready() -> void:
	$play.grab_focus() 
# -------------------------
# Play Button
# -------------------------

func _on_play_focus_entered() -> void:
	$play.modulate = Color.html("ff3636")
	$play.add_theme_font_size_override("font_size", 100)

func _on_play_focus_exited() -> void:
	$play.modulate = Color.WHITE
	$play.add_theme_font_size_override("font_size", 70)

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_play_mouse_entered() -> void:
	$play.grab_focus() # make hover = focus


# -------------------------
# Settings Button
# -------------------------

func _on_settings_focus_entered() -> void:
	$settings.modulate = Color.html("ff3636")
	$settings.add_theme_font_size_override("font_size", 100)

func _on_settings_focus_exited() -> void:
	$settings.modulate = Color.WHITE
	$settings.add_theme_font_size_override("font_size", 70)

func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/settings.tscn")

func _on_settings_mouse_entered() -> void:
	$settings.grab_focus()


# -------------------------
# Credits Button
# -------------------------

func _on_credits_focus_entered() -> void:
	$credits.modulate = Color.html("ff3636")
	$credits.add_theme_font_size_override("font_size", 100)

func _on_credits_focus_exited() -> void:
	$credits.modulate = Color.WHITE
	$credits.add_theme_font_size_override("font_size", 70)

func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/credits.tscn")

func _on_credits_mouse_entered() -> void:
	$credits.grab_focus()


# -------------------------
# Exit Button
# -------------------------

func _on_exit_focus_entered() -> void:
	$exit.modulate = Color.html("ff3636")
	$exit.add_theme_font_size_override("font_size", 100)

func _on_exit_focus_exited() -> void:
	$exit.modulate = Color.WHITE
	$exit.add_theme_font_size_override("font_size", 70)

func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_exit_mouse_entered() -> void:
	$exit.grab_focus()

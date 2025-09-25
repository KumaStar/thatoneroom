extends VBoxContainer

# Array of menu buttons for navigation
var menu_buttons = []
var current_focus_index = 0

func _ready() -> void:
	# Initialize the menu buttons array
	menu_buttons = [$play, $settings, $credits, $exit]
	$play.grab_focus()
	current_focus_index = 0
	
# Handle input events including mouse wheel
func _input(event) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.pressed:
			# Move focus to the next button
			current_focus_index = min(current_focus_index + 1, menu_buttons.size() - 1)
			menu_buttons[current_focus_index].grab_focus()
		elif event.button_index == MOUSE_BUTTON_WHEEL_UP and event.pressed:
			# Move focus to the previous button
			current_focus_index = max(current_focus_index - 1, 0)
			menu_buttons[current_focus_index].grab_focus()
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
	current_focus_index = 0 # Update current index when hovering


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
	current_focus_index = 1 # Update current index when hovering


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
	current_focus_index = 2 # Update current index when hovering


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
	current_focus_index = 3 # Update current index when hovering
